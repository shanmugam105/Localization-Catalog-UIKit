//
//  AppDelegate.swift
//  Localization-Catalog-UIKit
//
//  Created by sparkout on 05/03/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        setupHomeScreen()
        return true
    }
    
    func setupHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window?.rootViewController = vc
    }
}

extension AppDelegate {
    static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate // swiftlint:disable:this force_cast
}
