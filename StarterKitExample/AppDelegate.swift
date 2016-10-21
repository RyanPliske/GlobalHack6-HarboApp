import UIKit
import StarterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, StarterKitDelegate {

    var window: UIWindow?
    var starter: Starter!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let fbInfo = FacebookInfo(facebookAppId: "580752305447916", facebookAppDisplayName: "StarterKit")
        let appInfo = AppInfo(loginBackground: UIImage(named: "login1")!, facebookInfo: fbInfo)
        self.starter = Starter(window: &window, initialViewController: InitialViewController(), delegate: self, appInfo: appInfo)
        return true
    }
    
    func userWasAuthenticated(withCredentials credentials: Credentials) {
        ApplicationSession.mainInstance.userSession = UserSession(credentials: credentials)
    }
}

class ApplicationSession {
    
    var userSession: UserSession?
    
    static let mainInstance = {
        return ApplicationSession()
    }()
    
}

class UserSession {
    
    let credentials: Credentials
    let persistenceManager: PersistenceManager
    
    init(credentials: Credentials) {
        self.credentials = credentials
        self.persistenceManager = PersistenceManager()
    }
}

class PersistenceManager {
    
}