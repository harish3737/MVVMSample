//
//  MyPlanViewController.swift
//  Base
//
//  Created by Shyam Kumar on 21/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class MyPlanViewController: UIViewController {

    @IBOutlet weak var tblV: UITableView!
    var viewModel: ProfileViewModel!
    var datasouce: MyPlanDataSource!
    var delegate: MyPlanTblVDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = ProfileViewModel(vc: self)
        self.viewModel.initMyplan(tblV: tblV)
//        viewModel.initalLoads(tblView: tblV, viewController: self)
    }
 

}
