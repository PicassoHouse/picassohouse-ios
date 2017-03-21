//
//  PHTabBarController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 21/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit

class PHTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = Styles.tintColor
        tabBar.barTintColor = Styles.navigationBarTintColor
        tabBar.isTranslucent = false
    }
    
}
