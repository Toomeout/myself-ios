//
//  AppDelegate.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/25.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //window?.rootViewController = UINavigationController(rootViewController: ViewController())
        let weixin = WeiXinViewController()
        //weixin.tabBarItem.image = UIImage(named: "vdvdv")?.withRenderingMode(.alwaysOriginal)
        //weixin.tabBarItem.selectedImage = UIImage(named: "4")?.withRenderingMode(.alwaysOriginal)
        weixin.tabBarItem.title = "微信"
        weixin.tabBarItem.badgeValue = "10"
        weixin.tabBarItem.badgeColor = UIColor.red
        let weixinNavi = UINavigationController(rootViewController: weixin)
        let constract = ConstactViewController()
        //constract.tabBarItem.image = UIImage(named: "dvdfvdv")?.withRenderingMode(.alwaysOriginal)
        //constract.tabBarItem.selectedImage = UIImage(named: "3")?.withRenderingMode(.alwaysOriginal)
        constract.tabBarItem.title = "联系人"
        constract.title = "联系人"
        let constractNai = UINavigationController(rootViewController: constract)
        
        let found = FoundViewController()
        //found.tabBarItem.image = UIImage(named: "vdfvdfv")?.withRenderingMode(.alwaysOriginal)
        //found.tabBarItem.selectedImage = UIImage(named: "xzxxx")?.withRenderingMode(.alwaysOriginal)
        found.tabBarItem.title = "发现"
        
        let me = MeViewController()
        //me.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        //me.tabBarItem.selectedImage = UIImage(named: "qq")?.withRenderingMode(.alwaysOriginal)
        me.tabBarItem.title = "我"
        
        let bar = UITabBarController() //导航栏控制器
        bar.tabBar.tintColor = UIColor.init(red: 9/255.0, green: 187/255.0, blue: 7/255.0, alpha: 1)
        bar.viewControllers = [weixinNavi, constractNai, found, me]//添加子导航栏条目
        bar.selectedIndex = 0//设置开始显示条目
        window?.rootViewController = bar//加载导航栏控制器
        return true
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

