//
//  FirstViewController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit
import Charts

class InfoViewController: UIViewController {
    
    fileprivate var viewModel : LightsInfoViewModel!
    
    init(viewModel: LightsInfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    lazy var infoView = InfoView()
    
}


// MARK: - Lifecycler
// ---------------------------------

extension InfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        view = infoView
    }
    
}


// MARK - Setup
// ---------------------------------
extension InfoViewController {
    
    fileprivate func setup() {
        title = "Info"
    }
    
}

