Pod::Spec.new do |s|
  s.name         = 'DRDateHelpers'
  s.version      = '1.0.1'
  s.summary      = 'NSDate manipulation helpers for iOS'
  s.homepage     = 'https://github.com/darrarski/DRDateHelpers-iOS'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Dariusz Rybicki' => 'darrarski@gmail.com' }
  s.source       = { :git => 'https://github.com/darrarski/DRDateHelpers-iOS.git', :tag => 'v1.0.1' }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source_files = 'DRDateHelpers'
  s.requires_arc = true
end
