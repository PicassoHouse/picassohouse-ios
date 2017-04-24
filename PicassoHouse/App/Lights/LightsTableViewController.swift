//
//  FirstViewController.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit


class LightsTableViewController: UITableViewController {
    
    fileprivate let viewModel : LightsViewModel
    
    fileprivate struct Constants {
        static let cellIdentifier = "lightCell"
    }
    
    init(viewModel: LightsViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Lifecycler
// ---------------------------------

extension LightsTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Luzes"
        
        tableView.register(LightTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.backgroundColor = Styles.viewControllerBackgroundColor
        tableView.rowHeight = 80
        tableView.separatorColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tableView.tableFooterView = UIView()
    }
    
}

// MARK - LightsTableViewController DataSource & Delegates
// ---------------------------------
extension LightsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.roomsViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? LightTableViewCell ?? LightTableViewCell()
        cell.viewModel = viewModel.roomsViewModels[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.roomsViewModels.count - 1 {
            cell.separatorInset = .zero
        }
    }
   
    
}

