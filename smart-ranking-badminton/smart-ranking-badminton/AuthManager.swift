import Foundation

class AuthManager {
    static let shared = AuthManager()
    private init() {}
    
    private let key = "fakeUserToken"
    
    var isLoggedIn: Bool {
        UserDefaults.standard.string(forKey: key) != nil
    }
    
    func login() {
        UserDefaults.standard.set("fake-jwt-token-12345", forKey: key)
        AppFlowController.shared.showMainApp()
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
