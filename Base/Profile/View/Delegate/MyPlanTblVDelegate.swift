//
//  MyPlanTblVDelegate.swift
//  Base
//
//  Created by Shyam Kumar on 21/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class MyPlanTblVDelegate: NSObject, UITableViewDelegate {
    
    
    var viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: MyPlanTblVCell.identifier, for: indexPath) as! MyPlanTblVCell
        
       
        
    }
    
    
    
    
    
}

