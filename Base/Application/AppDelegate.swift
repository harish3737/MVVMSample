

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        Localizations.instance.setLanguage(languageCode: Language(rawValue: Language.english.code)!)
        GMSServices.provideAPIKey(googleMapKey)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.Ids.SigninController)
        let navVC = UINavigationController(rootViewController: initialViewController)
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
        
        
        
        return true
    }



}

