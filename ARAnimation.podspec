Pod::Spec.new do |s|
  s.name         = "ARAnimation"
  s.version      = "0.5"
  s.summary      = "Easily Core Animation and more!"
  s.homepage     = "https://github.com/AugustRush/ARAnimation"
  s.license      = "MIT"
  s.author             = { "AugustRush" => "819373341@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/AugustRush/ARAnimation.git", :tag => "0.5" }
  s.source_files  = "Source", "Source/**/*.{h,m}"
  s.exclude_files = "Source/Exclude"
  s.public_header_files = "Source/*.h"
  s.framework  = "QuartzCore"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
