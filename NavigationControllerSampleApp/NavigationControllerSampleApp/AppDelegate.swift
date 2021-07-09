//
//  AppDelegate.swift
//  NavigationControllerSampleApp
//
//  Created by Oh!ara on 2021/07/09.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var nav: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let first = SubViewController()
        nav = UINavigationController(rootViewController: first)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        print("nav:\(nav)")
        return true
    }
}

