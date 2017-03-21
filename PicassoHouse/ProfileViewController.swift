//
//  FirstViewController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    
}


// MARK: - Lifecycler
// ---------------------------------

extension ProfileViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        
        title = "Perfil"
    }
    
}

// MARK - ViewConfiguration
// ---------------------------------
extension ProfileViewController : ViewConfiguration {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func configureViews() {
        self.view.backgroundColor = Styles.viewControllerBackgroundColor
    }
    
}

