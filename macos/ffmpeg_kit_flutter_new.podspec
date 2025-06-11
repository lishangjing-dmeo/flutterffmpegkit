Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter_new_full_gpl'
  s.version          = '1.0.0'
  s.summary          = 'FFmpeg Kit for Flutter'
  s.description      = 'A Flutter plugin for running FFmpeg and FFprobe commands.'
  s.homepage         = 'https://github.com/sk3llo/ffmpeg_kit_flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ARTHENICA' => 'open-source@arthenica.com' }

  s.platform            = :osx
  s.requires_arc        = true
  s.static_framework    = true

  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.default_subspec     = 'full-gpl'

  s.dependency          'FlutterMacOS'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

  s.subspec 'full-gpl' do |ss|
    ss.source_files         = 'Classes/**/*'
    ss.public_header_files  = 'Classes/**/*.h'
    ss.osx.vendored_frameworks = 'Frameworks/ffmpeg-kit-macos-full-gpl/ffmpegkit.framework',
                                 'Frameworks/ffmpeg-kit-macos-full-gpl/libavcodec.framework',
                                 'Frameworks/ffmpeg-kit-macos-full-gpl/libavdevice.framework',
                                 'Frameworks/ffmpeg-kit-macos-full-gpl/libavfilter.framework',
                                 'Frameworks/ffmpeg-kit-macos-full-gpl/libavformat.framework',
                                 'Frameworks/ffmpeg-kit-macos-full-gpl/libavutil.framework',
                                 'Frameworks/ffmpeg-kit-macos-full-gpl/libswresample.framework',
                                 'Frameworks/ffmpeg-kit-macos-full-gpl/libswscale.framework'

    ss.osx.frameworks = 'AudioToolbox', 'CoreMedia'
    ss.libraries = 'z', 'bz2', 'c++', 'iconv'
    ss.osx.deployment_target = '10.15' # Adjust as needed for macOS

    # Adding pre-install hook for macOS
    s.prepare_command = <<-CMD
      if [ ! -d "./Frameworks" ]; then
        chmod +x ./setup_macos.sh
        ./setup_macos.sh
      fi
    CMD
  end

end
