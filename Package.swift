// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "test",
    products: [
        .library(name: "test", targets: ["test"]),
    ],
    dependencies: [
		.package(url: "https://github.com/IgorMuzyka/PackageConfig", .branch("master")),
 	    .package(url: "https://github.com/IgorMuzyka/phase", .branch("master")),
		.package(url: "https://github.com/IgorMuzyka/ignore", .branch("master")),
    ],
    targets: [
        .target(name: "test", dependencies: []),
        .testTarget(name: "testTests",dependencies: ["test"]),

		.target(name: "PackageConfigs", dependencies: [
			"PhaseConfig",
			"IgnoreConfig",
		]),
    ]
)

#if canImport(PhaseConfig)
import PhaseConfig

PhaseConfig(phases: []).write()
#endif

#if canImport(IgnoreConfig)
import IgnoreConfig

IgnoreConfig(excludedTargets: ["test", "testTests"]).write()
#endif
