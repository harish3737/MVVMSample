//
//  PaymentCollVCell.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class PaymentCollVCell: UICollectionViewCell {
    
    @IBOutlet weak var contentV: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        applyShadowOnView(self.contentV!)
//        contentV.layer.masksToBounds = false
        
    }

    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
