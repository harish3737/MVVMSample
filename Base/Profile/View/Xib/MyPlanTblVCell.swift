//
//  MyPlanTblVCell.swift
//  Base
//
//  Created by Shyam Kumar on 21/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class MyPlanTblVCell: UITableViewCell {

    
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var contentV: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        applyShadowOnView(self.contentV!)
        
        
        
    }
    
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
}
