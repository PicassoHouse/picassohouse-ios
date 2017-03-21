//
//  FirstViewController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit


enum DashboardMenu {
    case Lock, Lights, Windows, Garage, Infos, Users
}

protocol DashboardViewControllerDelegate : class {
    func dashboardViewController(_ controller: DashboardViewController, didSelect menu: DashboardMenu)
}


class DashboardViewController: UIViewController {

    private weak var delegate : DashboardViewControllerDelegate?
    
    // MARk - Initializers
    
    init(delegate : DashboardViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
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

