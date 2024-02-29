//
//  AppDelegate.swift
//  Sección 20 - Calculadora
//
//  Created by Jacob Aguilar on 29-02-24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //SETUP
        setupView()
        return true
    }

        
    //MARK: - Private methods
    func setupView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}

