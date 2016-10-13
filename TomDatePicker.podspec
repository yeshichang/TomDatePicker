Pod::Spec.new do |s|

s.name         = "TomDatePicker"
s.version      = "1.0"
s.summary      = "A small date selection"
s.homepage     = "https://github.com/yeshichang/TomDatePicker"
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "yeshichang" => "15238280098@163.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/yeshichang/TomDatePicker.git", :tag => s.version }
s.source_files  = 'DateKeyboard/**/*.{h,m}'
s.requires_arc = true
s.framework  = "UIKit"

end
