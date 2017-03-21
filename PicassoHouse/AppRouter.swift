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
    
    private var navigationController : UINavigationController!
    
    private var appLaunchOptions: [UIApplicationLaunchOptionsKey : Any]?
    
    
    //MAR: - Initializer
    
    init(appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        self.appLaunchOptions = appLaunchOptions
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    
    //MARK: - TabControllers
    
    lazy var dashboardController : UIViewController = {
        return DashboardViewController(delegate : nil)
    }()
    
    
    
    //  MARK:- Routes
    ///////////////////////////////
    
    func start() {
        navigationController = PHNavigationController(rootViewController: self.dashboardController)
        
        window.backgroundColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
