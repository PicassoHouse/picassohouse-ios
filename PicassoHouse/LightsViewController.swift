//
//  FirstViewController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit


class LightsViewController: UIViewController {
    
    
}


// MARK: - Lifecycler
// ---------------------------------

extension LightsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        
        title = "Luzes"
    }
    
}

// MARK - ViewConfiguration
// ---------------------------------
extension LightsViewController : ViewConfiguration {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        self.view.backgroundColor = Styles.viewControllerBackgroundColor
    }
    
}

