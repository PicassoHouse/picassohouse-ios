//
//  FirstViewController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit


class InfoViewController: UIViewController {
    
    
}


// MARK: - Lifecycler
// ---------------------------------

extension InfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        
        title = "Info"
    }
    
}

// MARK - ViewConfiguration
// ---------------------------------
extension InfoViewController : ViewConfiguration {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        self.view.backgroundColor = Styles.viewControllerBackgroundColor
    }
    
}

