struct CancelledError: LocalizedError {
  public var errorDescription: String { "Cancelled." }
}

struct UnimplementedError: LocalizedError {
  public var errorDescription: String { "Unimplemented." }
}

struct UndefinedError: LocalizedError {
  public var errorDescription: String { "Undefined error." }
}

struct TextError: LocalizedError {
  var message: String

  init(_ message: String) {
    self.message = message
  }

  public var errorDescription: String { message }
}
