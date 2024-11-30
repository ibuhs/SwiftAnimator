// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftAnimator",
    platforms: [
        .iOS(.v15)
    ],
    dependencies: [
        .package(url: "https://github.com/supabase-community/supabase-swift.git", from: "0.3.0"),
    ],
    targets: [
        .target(
            name: "SwiftAnimator",
            dependencies: [
                .product(name: "Supabase", package: "supabase-swift"),
            ]
        )
    ]
) 