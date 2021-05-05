//
//  PaymentViewController.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

   
    @IBOutlet weak var collV: UICollectionView!
    var viewModel: ProfileViewModel!
    var datasource: PaymentCollVDatasource!
    var delegate: PaymentCollVDelegate!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = ProfileViewModel(vc: self)
        viewModel.initalLoads(collV: self.collV)
        
    }
    


}
