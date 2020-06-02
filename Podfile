workspace 'FSGridView'

platform :ios, '8.0'

project 'Example/Example'
target 'Example' do
  #清除Pods警告
  inhibit_all_warnings!
  
  pod 'Masonry'
  pod 'FSGridView', :path => './'
  pod 'FSAttributedString'
end


# 消除安装最低版本警告
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
      end
    end
  end
end
