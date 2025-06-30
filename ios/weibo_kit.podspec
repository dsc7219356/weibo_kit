#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint weibo_kit.podspec` to validate before publishing.
#

pubspec = YAML.load_file(File.join('..', 'pubspec.yaml'))
library_version = pubspec['version'].gsub('+', '-')

Pod::Spec.new do |s|
  s.name             = 'weibo_kit'
  s.version          = library_version
  s.summary          = 'A powerful Flutter plugin allowing developers to auth/share with natvie Android & iOS Weibo SDKs.'
  s.description      = <<-DESC
A powerful Flutter plugin allowing developers to auth/share with natvie Android & iOS Weibo SDKs.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }

  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  
  # 源文件
  s.source_files = ['Classes/**/*.{h,m}', 'Weibo_SDK/**/*.{h,m}']
  s.public_header_files = ['Classes/**/*.h', 'Weibo_SDK/**/*.h']
  
  # 添加静态库
  s.vendored_libraries = 'Weibo_SDK/libWeiboSDK.a'
  
  # 资源文件
  s.resources = ['Weibo_SDK/**/*.bundle', 'Weibo_SDK/**/*.xcprivacy']

  s.static_framework = true

  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'HEADER_SEARCH_PATHS' => '"$(PODS_TARGET_SRCROOT)"',
    'OTHER_LDFLAGS' => '-ObjC'
  }

  # 确保所有头文件都能被找到
  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => '"$(PODS_TARGET_SRCROOT)"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
   s.resource_bundles = {'weibo_kit' => ['Resources/PrivacyInfo.xcprivacy']}
end
