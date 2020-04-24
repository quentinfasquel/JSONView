Pod::Spec.new do |spec|
spec.name         = "JSONView"
spec.version      = "0.0.3"
spec.summary      = "A light-weight SwiftUI visualizer of JSON content"
spec.homepage     = "https://github.com/quentinfasquel/JSONView"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "author" => "quentin.fasquel@gmail.com" }
spec.documentation_url = "https://github.com/quentinfasquel/JSONView"
spec.platforms = { :ios => "11.0" }
spec.swift_version = "5.2"
spec.source       = { :git => "https://github.com/quentinfasquel/JSONView.git", :tag => "#{spec.version}" }
spec.source_files  = "Sources/JSONView/**/*.swift"
spec.xcconfig = { "SWIFT_VERSION" => "5.2" }
end
