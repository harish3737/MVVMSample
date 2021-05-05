//
//  MyPlanVC.swift
//  Base
//
//  Created by Shyam Kumar on 20/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class MyPlanVC: UIViewController {

    
    @IBOutlet weak var contentV: UIView!
    
    @IBOutlet weak var continueBtn: UIButton!
    var viewModel: HomeViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       viewModel = HomeViewModel(vc: self)
       applyShadowOnView(contentV!)
        continueBtn.addTarget(viewModel, action: #selector(viewModel.continuePopV), for: .touchUpInside)
    }

}
