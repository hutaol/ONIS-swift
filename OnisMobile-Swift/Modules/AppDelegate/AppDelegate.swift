//
//  AppDelegate.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/3.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import RxSwift
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()

        // keyboard
        IQKeyboardManager.shared.enable = true
        
        // realm
        Rx_RealmUtility.creatDB(dataBaseName.db.rawValue).subscribe().disposed(by: DisposeBag())
        
        AppManager.config()
        
        Rx_RealmUtility.getObjects(type: User.self).subscribe(onNext: { (results) in
            mPrint("results:", results as Any)
            if results?.count == 0 {
                self.pushLogin()
            } else {
                self.pushTabBar()
                UserManager.autoUserLogin()
            }
            
        }).disposed(by: DisposeBag())
        
        // login change
        NotificationCenter.default.addObserver(self, selector: #selector(loginStateChange), name: NSNotification.Name(rawValue: "LoginStateChange"), object: nil)
        
        return true
    }
    
    @objc func loginStateChange(noti: Notification) {
        let isLogin: Bool = noti.object as! Bool

        if isLogin {
            pushTabBar()
        } else {
            pushLogin()
        }
    
    }
    
    func pushTabBar() {
        let tabbar = ONSTabBarViewController.init()
        self.window?.rootViewController = tabbar
    }
    
    func pushLogin() {
        let login = ONSLoginViewController.init()
        self.window?.rootViewController = login
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

