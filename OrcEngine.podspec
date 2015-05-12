Pod::Spec.new do |s|
  s.name         = "OrcEngine"
  s.version      = "0.1.0"
  s.summary      = "Client libraries for calling Rest services."
  s.description  = <<-DESC
		   Client libraries for calling Rest services.
		   These libraries are in preview.
                   DESC
  s.homepage     = "https://github.com/MSOpenTech/orc-for-ios"
  s.license      = "Apache License, Version 2.0"
  s.author             = { "guhans" => "v-guhans@microsoft.com" }
  s.social_media_url   = "http://twitter.com/OpenAtMicrosoft"

  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/MSOpenTech/orc-for-ios.git",
		             :branch => "dev"
		           }
  s.exclude_files = "**/Build/**/*"
  s.requires_arc = true

  # --- Subspecs ------------------------------------------------------------------#

  s.subspec 'Core' do |subspec|
     subspec.source_files  = "orc_engine_core/**/*.{h,m}"
     subspec.exclude_files = "orc_engine_core/Build/**/*"
     subspec.exclude_files = "orc_engine_core/orc_engine_coreTests/**/*"
     subspec.public_header_files = "orc_engine_core/**/*.h"
     subspec.header_dir = "orc_engine_core"
  end

  s.subspec 'Implementation' do |subspec|
     subspec.source_files = "orc_engine_impl/**/*.{h,m}"
     subspec.dependency "OrcEngine/Core"
     subspec.dependency "ADALiOS", "=1.2.2"
     subspec.dependency "LiveSDK"
     subspec.public_header_files = "orc_engine_impl/**/*.h"
     subspec.exclude_files = "orc_engine_impl/orc_engine_implTests/**/*"
     subspec.header_dir = "orc_engine_impl"
  end

end