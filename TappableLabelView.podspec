Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "TappableLabelView"
s.summary = "customizable and lightweight library that makes the task of displaying a lengthy text with tappable strings, as easy as you would like"
s.requires_arc = true

# 2
s.version = "1.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Malinka Seneviratne" => "malinkas86@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/malinkas86/TappableLabelView"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/malinkas86/TappableLabelView.git", 
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"

# 8
s.source_files = "TappableLabelView/**/*.{swift}"

# 9
s.resources = "TappableLabelView/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5.0"

end
