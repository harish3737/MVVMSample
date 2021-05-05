//
//  InviteReferalVC.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class InviteReferalVC: UIViewController {

    var viewModel: ProfileViewModel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var couponV: UIView!
    @IBOutlet weak var inviteBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = ProfileViewModel(vc: self)
        viewModel.setAttributedStr(lbl: contentLbl, toggle: false)
        viewModel.setShadow(btn: inviteBtn, view: couponV)
        
        
    }
    


}
