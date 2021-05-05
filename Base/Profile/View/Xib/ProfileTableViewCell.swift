//
//  ProfileTableViewCell.swift
//  Base
//
//  Created by Shyam Kumar on 09/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

   
    @IBOutlet weak var imgV: UIImageView!
    
    @IBOutlet weak var textLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
