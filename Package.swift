// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MyLibrary", type: .dynamic,       
            targets: ["MyLibrary"]),
    ],
    dependencies: [
      .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.5.1"),
      .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.7.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MyLibrary",
            dependencies: [.product(name: "Lottie", package: "lottie-spm"),
                           .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk")]),
    ]
)
