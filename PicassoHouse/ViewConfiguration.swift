//
//  ViewConfiguration.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

protocol ViewConfiguration: class {
    
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
}

