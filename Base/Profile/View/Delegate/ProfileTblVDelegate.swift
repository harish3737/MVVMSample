//
//  ProfileTblVDelegate.swift
//  Base
//
//  Created by Shyam Kumar on 09/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class ProfileTblVDelegate: NSObject, UITableViewDelegate {
    
    
    var viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        
        viewModel.didselectCell(index: indexPath, cell: cell)
        
    }

    
}
