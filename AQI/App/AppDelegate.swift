//
//  AppDelegate.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AQIViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
