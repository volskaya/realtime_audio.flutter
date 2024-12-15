import AVFoundation

class FileAudioPlayerNode: AVAudioPlayerNode {
  private var loopingPath: String? = nil
  private var loopingFile: AVAudioFile? = nil
  
  func play(_ path: String, loop: Bool = false) throws {
    let url = URL(fileURLWithPath: path)
    let file = try AVAudioFile(forReading: url)
    loopingPath = loop ? path : nil
    loopingFile = loop ? file : nil
    scheduleFileWithPlayedCallback(file, path)
    super.play()
  }
  
  override func stop() {
    loopingPath = nil
    loopingFile = nil
    super.stop()
  }
  
  private func scheduleFileWithPlayedCallback(_ file: AVAudioFile, _ path: String) {
    scheduleFile(file, at: nil) { [weak self] in
      DispatchQueue.main.async { [weak self] in self?.handleFilePlayed(path) }
    }
  }
  
  private func handleFilePlayed(_ path: String) {
    if path == loopingPath, isPlaying, let loopingFile {
      scheduleFileWithPlayedCallback(loopingFile, path)
    } else {
      stop()
    }
  }
}
