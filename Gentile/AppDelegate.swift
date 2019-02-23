//
//  AppDelegate.swift
//  Gentile
//
//  Created by Matheus Costa on 15/02/19.
//  Copyright © 2019 Matheus Costa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: ContactListCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navController = UINavigationController()
        self.coordinator = ContactListCoordinator(navigationController: navController)
        self.coordinator?.start()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataManager.saveContext()
    }

}
