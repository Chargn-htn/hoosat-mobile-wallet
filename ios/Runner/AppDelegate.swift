import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    private var methodChannel: FlutterMethodChannel?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Prefer the storyboard-created FlutterViewController (safer on iOS 13+ and avoids conflicts)
        if let existingController = window?.rootViewController as? FlutterViewController {
            // Ensure plugins are registered with the storyboard-created
            // FlutterViewController's registry. Registering with the
            // controller ensures its engine/plugin registry receives the
            // generated plugin registrations (Pigeon channels like
            // shared_preferences_foundation will be attached to the same
            // engine the controller uses).
            GeneratedPluginRegistrant.register(with: existingController)

            methodChannel = FlutterMethodChannel(
                name: "network.hoosat.wallet/links",
                binaryMessenger: existingController.binaryMessenger
            )
        } else {
            // Fallback: create and configure a Flutter engine and view controller
            let flutterEngine = FlutterEngine(name: "main_engine")
            flutterEngine.run()
            GeneratedPluginRegistrant.register(with: flutterEngine)

            let controller = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            // If window is nil (no storyboard), create one and attach the controller
            if window == nil {
                window = UIWindow(frame: UIScreen.main.bounds)
            }
            window?.rootViewController = controller
            window?.makeKeyAndVisible()

            methodChannel = FlutterMethodChannel(
                name: "network.hoosat.wallet/links",
                binaryMessenger: controller.binaryMessenger
            )
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
