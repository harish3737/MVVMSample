//
//  MyAccountTblVDelegate.swift
//  Base
//
//  Created by Shyam Kumar on 23/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class ProfileDetailTblVDelegate: NSObject, UITableViewDelegate {
    
    var viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    
}
