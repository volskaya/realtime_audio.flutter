protocol ChunkAudioEventListener: AnyObject {
  func onChunkQueued(_ id: String)
  func onChunkPlayed(_ id: String)
  func onChunkQueueStarted(_ id: String)
  func onChunkQueueEnded()
}
