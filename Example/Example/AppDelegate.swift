//
//  AppDelegate.swift
//  Example
//
//  Created by Sawan Kumar on 07/04/19.
//  Copyright © 2019 Sawan Kumar. All rights reserved.
//

import UIKit
import SideMenuDrawer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        return true
    }
  

}

