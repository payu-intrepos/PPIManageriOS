Pod::Spec.new do |s|
  s.name                = "PayUIndia-PPI-SDK"
  s.version             = "1.0.0"
  s.license             = "MIT"
  s.homepage            = "https://github.com/payu-intrepos/PPIManageriOS"
  s.author              = { "PayU" => "contact@payu.in"  }

  s.summary             = "PPI SDK for iOS by PayUbiz"
  s.description         = "PPI iOS SDK provides virtual cards."

  s.source              = { :git => "https://github.com/payu-intrepos/PPIManageriOS.git",
                            :tag => "#{s.version}"
                          }
  s.documentation_url   = "https://devguide.payu.in/mobile-sdk-ios/introduction-to-payu-mobile-sdk/"
  s.platform            = :ios , "13.0"
  s.vendored_frameworks = 'OnePayUJSKit.xcframework'

  s.dependency            'PayUIndia-NetworkReachability', '~> 2.0'
  s.dependency            'PayUIndia-CrashReporter', '~> 4.0'

end
