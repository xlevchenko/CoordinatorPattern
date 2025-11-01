//
//  AppDelegate.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let view = MainView()
        let controller = UIHostingController(rootView: view)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

