//
//  AppDelegate.swift
//  NewsFeed
//
//  Created by Евгений колесников on 02.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        let feedController = FeedViewController(nibName: nil, bundle: nil)
        navController.viewControllers = [feedController]
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }

}

