import UIKit
import StarterKit
import FBSDKCoreKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, StarterKitDelegate {

    var window: UIWindow?
    var starter: Starter!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let fbInfo = FacebookInfo(facebookAppId: "580752305447916", facebookAppDisplayName: "StarterKit")
        let appInfo = AppInfo(facebookInfo: fbInfo)
        self.starter = Starter(window: &window, initialViewController: InitialViewController(), delegate: self, appInfo: appInfo)
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    @available(iOS 9.0, *)
    func application(application: UIApplication,openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        let returnValue = FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as! String, annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
        return returnValue
    }
    
    @available(iOS, introduced=8.0, deprecated=9.0)
    func application(application: UIApplication,openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication!, annotation: annotation)
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