//
//  MyAccountVC.swift
//  Base
//
//  Created by Shyam Kumar on 23/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class MyAccountVC: UIViewController {

    var viewModel: ProfileViewModel!
    var datasource: ProfileDetailTblVDatasource!
    var delegate: ProfileDetailTblVDelegate!
    @IBOutlet weak var tblV: UITableView!
    
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel = ProfileViewModel(vc: self)
        viewModel.myAccountInitialLoads(tblV: tblV, lbl: nameLbl)
    }
    



}
