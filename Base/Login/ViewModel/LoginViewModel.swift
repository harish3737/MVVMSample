//
//  LoginViewModel.swift
//  Base
//
//  Created by Shyam Kumar on 31/03/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit


class LoginViewModel {
    
    var vc : UIViewController = UIViewController()
    
    init(vc : UIViewController){
        self.vc = vc
    }
    
   @objc func signAct(nav: UINavigationController) {
    print("sdfghj")
    
    vc.push(id: Storyboard.Ids.HomeController, animation: true, sb: "Home")
    }
    
   @objc func signUpAct(nav: UINavigationController) {
     
    vc.push(id: Storyboard.Ids.SignupController, animation: true, sb: "Main")
    }
    
    @objc func signNavAct(nav: UINavigationController) {
     print("sdfghj")
        
        vc.push(id: Storyboard.Ids.SigninController, animation: true, sb: "Main")
     }
    
    func setAttributedText(btn: UIButton) {
        let a = #colorLiteral(red: 0.9542174935, green: 0.3704305291, blue: 0.330014199, alpha: 1)
    
        let attrString = NSMutableAttributedString(string: "By registering you confirm that you accept our",
                                                   attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black ]);

        attrString.append(NSMutableAttributedString(string: " Terms of Use",
                                                    attributes: [ NSAttributedString.Key.foregroundColor: a]));
        
  
        
        
        attrString.append(NSMutableAttributedString(string: " Privacy Policy",
                                                    attributes: [ NSAttributedString.Key.foregroundColor: a]));
        
        
        
        btn.setAttributedTitle(attrString, for: .normal)
        
        btn.titleLabel?.numberOfLines = 0
    }
    
    func applyShadow(views: [UIView]) {
        
        views.forEach({applyShadowOnView($0)})
        
    }
    
    func initialLoads(viewController: SignupViewController) {
       
        self.setAttributedText(btn: viewController.termsBtn)
        viewController.registerBtn.addTarget(self, action: #selector(self.signAct(nav:)), for: .touchUpInside)
        viewController.signInBtn.addTarget(self, action: #selector(self.signNavAct(nav:)), for: .touchUpInside)
    }
    
   
}
