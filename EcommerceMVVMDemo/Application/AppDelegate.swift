//
//  AppDelegate.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    var window: UIWindow?
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        IQKeyboardManager.shared.enable = true
        
        if (UserDetails.IS_LOGIN){
            let ctrl =  mainStoryboard.instantiateViewController(withIdentifier: "TabBarVC")as! TabBarVC
            let navCtrl =  UINavigationController(rootViewController: ctrl)
            navCtrl.navigationBar.isHidden = true
            let keywindow =  UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            keywindow?.rootViewController =  navCtrl
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

