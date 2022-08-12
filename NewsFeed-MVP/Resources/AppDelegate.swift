//
//  AppDelegate.swift
//  NewsFeed-MVP
//
//  Created by Евгений колесников on 11.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NewsFeedViewController(nibName: nil, bundle: nil)
        window?.makeKeyAndVisible()
        return true
    }
}

