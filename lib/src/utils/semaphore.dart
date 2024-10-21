import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';

/// An acquire / release semaphore.
class Semaphore {
  Semaphore(this.count) : assert(count > 0, 'Semaphore count must be positive');

  final Queue<Completer<void>> _waitQueue = Queue<Completer<void>>();
  final int count;
  int _currentCount = 0;
  bool get locked => _currentCount > 0;

  /// Acquires a permit from this semaphore, asyncronously blocking until one is
  /// available.
  Future<void> acquire() {
    if (_currentCount + 1 <= count) {
      _currentCount++;
      // Prevent the event loop from sleeping, if the lock
      // is available instantly
      return SynchronousFuture<void>(null);
    } else {
      final Completer<void> completer = Completer<void>();
      _waitQueue.add(completer);
      return completer.future;
    }
  }

  /// Releases a permit, returning it to the semaphore.
  void release() {
    if (_currentCount == 0) {
      throw StateError('Unable to release semaphore');
    }

    _currentCount--;
    if (_waitQueue.isNotEmpty) {
      _currentCount++;
      _waitQueue.removeFirst().complete();
    }
  }

  Future<void> withLock(FutureOr<void> Function() callback) async {
    await acquire();
    try {
      await callback();
    } finally {
      release();
    }
  }
}
