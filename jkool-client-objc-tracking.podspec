Pod::Spec.new do |s|
  s.name             = 'jkool-client-objc-tracking'
  s.version          = '0.1.5'
  s.summary          = 'Stream user experience data into jKool.'

  s.description      = <<-DESC
The jKool Tracking API will automatically stream your user's experience with your app into your jKool repository. With a jKool subscription, you can then view this data about your user's experience with your app graphically. User clicks and the screens they visited will be streamed as 'Events'. Data about the user's entire session as well as information about their device will be streamed as 'Activities'.
                       DESC

  s.homepage         = 'https://github.com/Nastel/jkool-client-objc-tracking'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'jKool developer' => 'support@jkoolcloud.com' }
  s.source           = { :git => 'https://github.com/Nastel/jkool-client-objc-tracking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'jkool-client-objc-tracking/Classes/**/*'

  s.dependency 'jkool-client-objc-api'
end
