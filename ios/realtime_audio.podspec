#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint sound_stream.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'realtime_audio'
  s.version          = '0.1.0'
  s.summary          = 'Realtime audio plugin for Flutter.'
  s.description      = <<-DESC
  Realtime audio plugin for Flutter.
                       DESC
  s.homepage         = 'https://github.com/volskaya/realtime_audio.flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Roland' => 'roland@volskaya.dev' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
