//
//  AppDelegate.swift
//  CoreDataExample
//
//  Created by Piotr Torczyński on 02/10/2018.
//  Copyright © 2018 Smartapps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    private let applicationDependencies = DefaultApplicationDependenciesProvider()
    private lazy var applicationController = ApplicationController(dependencies: self.applicationDependencies)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window!.rootViewController = applicationController.rootViewController
        window!.makeKeyAndVisible()

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        applicationController.saveContext()
    }
}

