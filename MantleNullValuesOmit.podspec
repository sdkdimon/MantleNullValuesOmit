Pod::Spec.new do |s|
  s.name             = "MantleNullValuesOmit"
  s.version          = "0.0.1"
  s.summary          = "Mantle categories that can ignore null values."
  s.homepage         = "https://github.com/sdkdimon/MantleNullValuesOmit"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Dmitry Lizin" => "sdkdimon@gmail.com" }
  s.source           = { :git => "https://github.com/sdkdimon/MantleNullValuesOmit.git", :tag => s.version }

  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.module_name = 'MantleNullValuesOmit'
  s.source_files = 'MantleNullValuesOmit/MantleNullValuesOmit/*.{h,m}'
  s.dependency 'Mantle', '2.0.7'

end



