//
//  HistoryViewController.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    var viewModel: ProfileViewModel!
    var datasouce: HistoryTblVDatasource!
    var delegate: HistoryTblVDelegate!
    
    @IBOutlet weak var tblV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ProfileViewModel(vc: self)
        viewModel.historyInitalLoads(tblView: tblV)
        
    }
    


}
