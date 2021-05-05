//
//  ProfileViewController.swift
//  Base
//
//  Created by Shyam Kumar on 08/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

   
    @IBOutlet weak var tblV: UITableView!
    var viewModel: ProfileViewModel!
    var datasouce: ProfileTblVDatasource!
    var delegate: ProfileTblVDelegate!
    @IBOutlet weak var imgV: UIImageView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel = ProfileViewModel(vc: self)
        viewModel.initalLoads(tblView: self.tblV)
        viewModel.navToMyAccount(imgView: imgV, ViewController: self)
    }
    
   

}
