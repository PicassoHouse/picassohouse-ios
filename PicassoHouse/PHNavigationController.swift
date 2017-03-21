//
//  PHNavigationController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit

class PHNavigationController : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setup() {
        
        navigationBar.barTintColor = Styles.navigationBarTintColor
        navigationBar.tintColor = .white
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = false
    }
    
}
