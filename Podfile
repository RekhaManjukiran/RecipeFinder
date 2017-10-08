platform :ios, '9.3'

use_frameworks!

def global_pods

  	#Api Endpoints
  	pod 'Alamofire'
  	pod 'SDWebImage'
    pod 'MBProgressHUD'
end

target 'RecipeFinder' do
    global_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
        end
    end
end
