//
//  AppDelegate.swift
//  TwitterLBTA
//
//  Created by BeInMedia on 10/11/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // igonre storboard and i'll expain in ep 2 
        window = UIWindow(frame: UIScreen.main.bounds)
//        let vc = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
//        window?.rootViewController = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = UINavigationController(rootViewController: HomeDatasourceController())
        window?.makeKeyAndVisible()
               
        return true
    }

  


}

