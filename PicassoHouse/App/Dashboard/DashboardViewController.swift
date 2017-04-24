//
//  FirstViewController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController {
    
    
}


// MARK: - Lifecycler
// ---------------------------------

extension DashboardViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        
        title = "Dashboard"
    }
    
}

// MARK - ViewConfiguration
// ---------------------------------
extension DashboardViewController : ViewConfiguration {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        self.view.backgroundColor = Styles.viewControllerBackgroundColor
    }
    
}

