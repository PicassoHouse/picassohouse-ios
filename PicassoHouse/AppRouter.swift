//
//  AppRouter.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit

final class AppRouter {
    
    private var window: UIWindow
    
    private var tabBarController : UITabBarController!
    
    private var appLaunchOptions: [UIApplicationLaunchOptionsKey : Any]?
    
    
    //MAR: - Initializer
    
    init(appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        self.appLaunchOptions = appLaunchOptions
        
        tabBarController = PHTabBarController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        
    }
    
    
    //MARK: - TabControllers
    
    lazy var dashboardTabController : UIViewController = {
        let vc = DashboardViewController()
        let nav = PHNavigationController(rootViewController: vc)
        nav.tabBarItem = UITabBarItem(title: "Dashboard", image: #imageLiteral(resourceName: "first"), tag: 1)
        return nav
    }()
    
    lazy var lightsTabController : UIViewController = {
        let vc = LightsViewController()
        let nav = PHNavigationController(rootViewController: vc)
        nav.tabBarItem = UITabBarItem(title: "Luzes", image: #imageLiteral(resourceName: "first"), tag: 1)
        return nav
    }()
    
    
    lazy var infoTabController : UIViewController = {
        let vc = InfoViewController()
        let nav = PHNavigationController(rootViewController: vc)
        nav.tabBarItem = UITabBarItem(title: "Infos", image: #imageLiteral(resourceName: "first"), tag: 1)
        return nav
    }()
    
    
    lazy var profileTabController : UIViewController = {
        let vc = ProfileViewController()
        let nav = PHNavigationController(rootViewController: vc)
        nav.tabBarItem = UITabBarItem(title: "Perfil", image: #imageLiteral(resourceName: "second"), tag: 1)
        return nav
    }()
    
    
    
    
    //  MARK:- Routes
    ///////////////////////////////
    
    func start() {
        tabBarController.viewControllers = [
            dashboardTabController,
            lightsTabController,
            infoTabController,
            profileTabController
        ]
    }
    
}
