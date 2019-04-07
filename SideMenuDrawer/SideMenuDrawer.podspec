
    Pod::Spec.new do |s|


    s.name                  =  "SideMenuDrawer"
    s.version               = "1.0.0"
    s.summary               = "This framework is used to create slidemenu."
    s.description           = "This framework is used to create slidemenu as in android"
    s.homepage              = "https://github.com/sawanmind/SideMenuDrawer"
    s.license               = "MIT"
    s.author                = { "Sawan Kumar" => "sawanmind@gmail.com" }
    s.social_media_url      = "http://twitter.com/sawanmind"
    s.platform              = :ios, "11.0"
    s.source                = { :git => "https://github.com/sawanmind/SideMenuDrawer.git", :tag => "#{s.version}" }
    s.source_files          = "SideMenuDrawer/**/*"
    s.frameworks            = "UIKit", "Foundation"

    end
