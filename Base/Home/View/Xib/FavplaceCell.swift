//
//  FavplaceCell.swift
//  CompareYourFare
//
//  Created by CSS on 24/03/21.
//

import UIKit

class FavplaceCell: UICollectionViewCell {

    
    @IBOutlet weak var textLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
       
        applyShadowOnView(textLbl!)
        
       textLbl.layer.masksToBounds = false
        textLbl.clipsToBounds = true
    }
   
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
        
    }

}
