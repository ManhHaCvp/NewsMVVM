import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIContainer = AppDIContainer()
    var appFlowCoordinator: AppFlowCoordinator?
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
//        AppAppearance.setupAppearance()
//        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let navigationController = UINavigationController()
//
//        window?.rootViewController = navigationController
//        appFlowCoordinator = AppFlowCoordinator(
//            navigationController: navigationController,
//            appDIContainer: appDIContainer
//        )
//        appFlowCoordinator?.start()
//        window?.makeKeyAndVisible()
        
        
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false

        window = UIWindow(frame: UIScreen.main.bounds)

//        let loginVC = LoginViewController()
//        let navController = UINavigationController(rootViewController: loginVC)
        let splashVC = SplashViewController()

        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        CoreDataStorage.shared.saveContext()
    }

    func overrideInterfaceStyleGlobally(_ style: UIUserInterfaceStyle) {
        UIApplication.shared.connectedScenes.forEach { scene in
            if let windowScene = scene as? UIWindowScene {
                windowScene.windows.forEach { window in
                    window.overrideUserInterfaceStyle = style
                }
            }
        }
    }
}
