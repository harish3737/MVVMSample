//
//  HelpViewController.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    var viewModel: ProfileViewModel!
    var datasource: HelpTblVDatasource!
    var delegate: HelpTblVDelegate!
    @IBOutlet weak var termsV: UIView!
    
    @IBOutlet weak var privacyV: UIView!
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel = ProfileViewModel(vc: self)
        viewModel.helpInitalLoads(tblView: tbl, views: [termsV, privacyV])
    }
    


}
