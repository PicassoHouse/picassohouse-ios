//
//  LightTableViewCell.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 26/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LightTableViewCell: UITableViewCell {
    
    var disposeBag = DisposeBag()
    
    var viewModel: LightItemViewModel? = nil {
        didSet {
            bindViews()
        }
    }
    
    
    private let switchButton = UISwitch()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryView = switchButton
        selectionStyle = .none
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }
    
    
    private func setupUI() {
        backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        textLabel?.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        switchButton.onTintColor = Styles.tintColor
    }
    
    private func bindViews() {
        guard let viewModel = viewModel else { return }
        
        imageView?.image = viewModel.roomType.image.withColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        textLabel?.text = viewModel.roomTitle
        
        switchButton.isOn = viewModel.isLightOn
        
        switchButton.rx.isOn.changed
            .bindTo(viewModel.didChangeLightStatusTo)
            .disposed(by: disposeBag)
    }
    
}
