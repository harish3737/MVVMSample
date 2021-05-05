//
//  ContinuePopUpVC.swift
//  Base
//
//  Created by Shyam Kumar on 20/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class ContinuePopUpVC: UIViewController {

    
    @IBOutlet weak var okBtn: UIButton!
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel(vc: self)
        
        okBtn.addTarget(viewModel, action: #selector(viewModel.dismissPopUp), for: .touchUpInside)
       
    }
    

  

}
