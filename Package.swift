// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PayUIndia-PPI-SDK",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PayUIndia-PPI-SDK",
            targets: ["PayUIndia-PPI-SDKTarget"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "PayUIndia-CrashReporter",url: "https://github.com/payu-intrepos/PayUCrashReporter-iOS",from: "4.0.0"),
        .package(name: "PayUIndia-NetworkReachability", url: "https://github.com/payu-intrepos/PayUNetworkReachability-iOS", from: "2.1.0")
    ],
    targets: [
        
        .target(
            name: "PayUIndia-PPI-SDKTarget",
            dependencies: [
                "OnePayUJSKit",
                .product(name: "PayUIndia-CrashReporter", package: "PayUIndia-CrashReporter"),
                .product(name: "PayUIndia-NetworkReachability", package: "PayUIndia-NetworkReachability")
            ],
            path: "PayUIndia-PPI-SDKWrapper"
        ),
        
            .binaryTarget(name: "OnePayUJSKit", path: "./OnePayUJSKit.xcframework"),
    ]
)
