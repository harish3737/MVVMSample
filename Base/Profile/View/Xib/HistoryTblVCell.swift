//
//  HistoryTblVCell.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class HistoryTblVCell: UITableViewCell {

   
    @IBOutlet weak var contentV: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyShadowOnView(contentV!)
//        contentV.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
