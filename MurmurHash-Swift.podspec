Pod::Spec.new do |s|
s.name         = "MurmurHash-Swift"
s.version      = "1.0.0"
s.summary      = "MurmurHash framework by Swift."
s.homepage     = "https://github.com/daisuke-t-jp/MurmurHash-Swift"
s.screenshots  = "https://raw.githubusercontent.com/daisuke-t-jp/MurmurHash-Swift/master/doc/header.png"
s.license      = "MIT"
s.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }

s.requires_arc = true
s.swift_version  = "4.2"
s.ios.deployment_target = "10.0"
s.osx.deployment_target = "10.12"

s.source       = { :git => "https://github.com/daisuke-t-jp/MurmurHash-Swift.git", :tag => s.version }
s.source_files  = 'MurmurHash/MurmurHash/*.{h,swift}'
end
