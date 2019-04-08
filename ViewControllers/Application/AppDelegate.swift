//
//  AppDelegate.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let emptyArr = [Product]()
        let startSegmentIndex = 0
        let sections = [emptyArr, emptyArr]
        let apiService = ProductApiService()
        let viewModel = ListViewModel(sections: sections, curSegment: startSegmentIndex, apiService: apiService)
        let vc = ListVC.createWith(storyboardName: "Product", vcIdentifier: "ListVC", title: "Products", viewModel: viewModel)        
        let rootNav = UINavigationController(rootViewController: vc)
        rootNav.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

