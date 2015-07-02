  Pod::Spec.new do |s|
  s.name         = "orc"
  s.version      = "0.10.2"
  s.summary      = "Office REST Client for Office 365 APIs"
  s.description  = <<-DESC
		   Client stack for Office 365 REST APIs and SDKs.
		   These libraries are in preview.
                   DESC
  s.homepage     = "https://github.com/MSOpenTech/orc-for-ios"
  s.license      = "MIT"
  s.author             = { "joshgav" => "joshgav@microsoft.com" }
  s.social_media_url   = "http://twitter.com/OpenAtMicrosoft"

  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/MSOpenTech/orc-for-ios.git" ,
                     :tag => "v#{s.version}"}
  s.exclude_files = "**/Build/**/*"
  s.source_files = "orc.h"
  s.header_dir = "orc"
  s.requires_arc = true

  # --- Subspecs ------------------------------------------------------------------#

  s.subspec 'api' do |subspec|
     subspec.source_files  = "api/**/*.{h,m}"
     subspec.exclude_files = "api/apiTests/**/*"
     subspec.public_header_files = "api/**/*.h"
     subspec.header_dir = "api"
  end

  s.subspec 'core' do |subspec|
    subspec.dependency 'orc/api'
    subspec.source_files  = "core/**/*.{h,m}"
    subspec.exclude_files = "core/coreTests/**/*"
    subspec.public_header_files = "core/**/*.h"
    subspec.header_dir = "core"
  end

  s.subspec 'impl' do |subspec|
    subspec.dependency 'orc/core'
    subspec.dependency 'ADALiOS', '=1.2.4'
    subspec.dependency 'LiveSDK', '=5.6.1'
    subspec.source_files  = "impl/**/*.{h,m}"
    subspec.exclude_files = "impl/implTests/**/*"
    subspec.public_header_files = "impl/**/*.h"
    subspec.header_dir = "impl"
  end

end
