package dev.volskaya.realtime_audio.utils

interface ChunkAudioEventListener {
  fun onChunkQueued(id: String)
  fun onChunkPlayed(id: String)
  fun onChunkQueueStarted(id: String)
  fun onChunkQueueEnded()
}

