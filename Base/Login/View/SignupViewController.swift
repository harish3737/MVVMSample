//
//  SignupViewController.swift
//  CompareYourFare
//
//  Created by CSS on 24/03/21.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var termsBtn: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var userNameV: UIView!
    
    @IBOutlet weak var passwordV: UIView!
    
    @IBOutlet weak var confirmV: UIView!
    
    @IBOutlet weak var confirmPasswordV: UIView!
    
    @IBOutlet weak var inviteV: UIView!
    
    var viewModel: LoginViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LoginViewModel(vc: self)
        viewModel.initialLoads(viewController: self)
        
    }
    

    
    
    

}
