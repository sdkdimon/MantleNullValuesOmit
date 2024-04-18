Pod::Spec.new do |s|
  s.name             = "MantleNullValuesOmit"
  s.version          = "0.0.5"
  s.summary          = "Mantle categories that can ignore null values."
  s.homepage         = "https://github.com/sdkdimon/MantleNullValuesOmit"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Dmitry Lizin" => "sdkdimon@gmail.com" }
  s.source           = { :git => "https://github.com/sdkdimon/MantleNullValuesOmit.git", :tag => s.version }

  s.platform     = :ios
  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.14'
  s.requires_arc = true
  s.module_name = 'MantleNullValuesOmit'
  s.module_map = 'MantleNullValuesOmit/MantleNullValuesOmit/MantleNullValuesOmit.modulemap'
  s.source_files = 'MantleNullValuesOmit/MantleNullValuesOmit/*.{h,m}'
  s.dependency 'DLMantle', '~> 2.2'
end