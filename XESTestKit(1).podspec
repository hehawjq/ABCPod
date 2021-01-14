Pod::Spec.new do |s|

s.name         = "XESTestKit"
s.version      ="0.0.16"
s.summary      = "测试pod使用 XESTestKit库."

s.description  = <<-DESC
                        测试pod使用 XESTestKit库
                    DESC

s.homepage     = "https://git.100tal.com/****/XESTestKit"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "liuhuagong" => "liuhuagong@100tal.com" }
s.ios.deployment_target = "9.0"
s.source       = { :git => 'https://git.100tal.com/****/XESTestKit.git', :tag => s.version}
s.vendored_frameworks = 'XESTestSDKFramework/*.framework'
s.source_files  = 'XESTestSDKFramework/*.framework/Headers/*.h'

s.requires_arc = true

#s.resource_bundles = {
#'XESTestKit' => ['XESTestSDKFramework/*.framework/*.car']
#}

#s.resources = ['XESTestSDKFramework/*.framework/aaa.plist','XESTestSDKFramework/*.framework/bbb.plist','XESTestSDKFramework/*.framework/*.json']

#s.ios.frameworks = "AVFoundation", "MediaPlayer"

#需要的系统libraries
#s.libraries    = "stdc++","bz2","c++","z","resolv"

#s.static_framework = true
#s.dependency 'SDWebImage', '5.2.5'
#s.dependency 'MJRefresh'

end
