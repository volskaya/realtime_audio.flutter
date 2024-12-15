Pod::Spec.new do |s|
  s.name             = 'realtime_audio'
  s.version          = '0.0.1'
  s.summary          = 'Audio package to handle streaming chunk playback & recording to use with realtime APIs like OpenAI Realtime, HumeAI Voice and others.'
  s.description      = <<-DESC
  Realtime audio plugin for Flutter.
                       DESC
  s.homepage         = 'https://github.com/volskaya/realtime_audio.flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Roland' => 'roland@volskaya.dev' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '11.5'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
