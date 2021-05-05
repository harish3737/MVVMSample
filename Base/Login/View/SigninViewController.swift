//
//  SigninViewController.swift
//  CompareYourFare
//
//  Created by CSS on 24/03/21.
//

import UIKit

class SigninViewController: UIViewController {

 
    @IBOutlet weak var signinBtn: UIButton!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var userNameV: UIView!
    
    @IBOutlet weak var passwordV: UIView!
    
    var viewModel: LoginViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = LoginViewModel(vc: self)
         
        self.navigate()
        
        viewModel.applyShadow(views: [userNameV, passwordV])
    }
    
    func navigate() {
        signinBtn.addTarget(viewModel, action: #selector(viewModel.signAct(nav:)), for: .touchUpInside)
        signupBtn.addTarget(viewModel, action: #selector(viewModel.signUpAct(nav:)), for: .touchUpInside)
    }
    
    }


