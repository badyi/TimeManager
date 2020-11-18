//
//  AppDelegate.swift
//  TimeManager
//
//  Created by и on 04.11.2020.
//  Copyright © 2020 badyi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainTabBarController = MainTabBarController()
        let mainNavigationController = MainNavigationController()
        //let dayVC = DayViewController()
        //dayVC.title = "DayVC"
        
        //mainNavigationController.viewControllers = [dayVC]
        mainTabBarController.viewControllers = [mainNavigationController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = mainTabBarController
        
        return true
    }
}
