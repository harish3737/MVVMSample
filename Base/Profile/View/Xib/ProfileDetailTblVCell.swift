//
//  ProfileDetailTblVCell.swift
//  Base
//
//  Created by Shyam Kumar on 23/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class ProfileDetailTblVCell: UITableViewCell {

   
    @IBOutlet weak var contentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
