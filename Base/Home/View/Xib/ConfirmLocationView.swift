//
//  ConfirmLocationView.swift
//  CompareYourFare
//
//  Created by CSS on 24/03/21.
//

import UIKit

class ConfirmLocationView: UIView {

    var Confirm : (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func confirmClickEvennt(_ sender: Any) {
        
        self.Confirm?()
        
    }
    
}
