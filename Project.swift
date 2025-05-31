import ProjectDescription



let project = Project(
    name: "HelloTuist",
    settings: Project.settings,
    targets: [
        .target(
            name: "HelloTuist",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.HelloTuist",
            infoPlist: .extendingDefault(with: [
                "CFBundleDisplayName": "Tuist App",
                "CFBundleShortVersionString": "$(MARKETING_VERSION)",
                "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)"
            ]),
            sources: ["HelloTuist/Sources/**"],
            resources: ["HelloTuist/Resources/**"],
            dependencies: [
                .external(name: "Kingfisher")
            ],
            settings: Target.settings
        ),
        .target(
            name: "HelloTuistTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.HelloTuistTests",
            infoPlist: .default,
            sources: ["HelloTuist/Tests/**"],
            resources: [],
            dependencies: [.target(name: "HelloTuist")]
        ),
    ]
)

public extension Project {
    static let settings: Settings = {
        let baseConfiguration: SettingsDictionary = [
            "MARKETING_VERSION": "1.2.3",
            "CURRENT_PROJECT_VERSION": "42"
        ]
        let releaseConfiguration = baseConfiguration
        return Settings.settings(base: baseConfiguration, debug: baseConfiguration, release: releaseConfiguration)
    }()
}

public extension Target {
    static let settings: Settings = {
        let baseConfiguration: SettingsDictionary = [:]
        var releaseConfig = baseConfiguration
        return Settings.settings(base: baseConfiguration, debug: baseConfiguration, release: releaseConfig)
    }()
}
