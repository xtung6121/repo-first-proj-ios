
import UIKit

class AppFlowController {
    static let shared = AppFlowController()
    private init() {}
    private var window: UIWindow?
    
    func start(in windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        
        if AuthManager.shared.isLoggedIn {
            showMainApp()
        } else {
            showLogin()
        }
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func showLogin() {
        let loginVC = LoginViewController()
        let nav = UINavigationController(rootViewController: loginVC)
        nav.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = nav
    }
    
    func showMainApp() {
        let tabBar = MainTabBarController()
        window?.rootViewController = tabBar
    }
    
    func logout() {
        AuthManager.shared.clear()
        showLogin()
    }
}
