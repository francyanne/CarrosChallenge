//
//  AppDelegate.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 28/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: getRootViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
    func getRootViewController() -> UIViewController {
        if SessionManager.shared.hasSession() {
            return CarsViewController()
        }
        return LoginViewController()
    }
    
    static func setRootViewController(controller: UIViewController, animated: Bool) {
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        let window = UIApplication.shared.windows.first
        guard animated, let window = window else {
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.4, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
}


