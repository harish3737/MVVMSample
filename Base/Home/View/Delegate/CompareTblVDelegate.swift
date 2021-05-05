//
//  CompareTblVDelegate.swift
//  Base
//
//  Created by Shyam Kumar on 20/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit


class CompareTblVDelegate: NSObject, UITableViewDelegate {
    

    let viewModel: HomeViewModel!
    
    init(vm: HomeViewModel) {
        viewModel = vm
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CompareTblVCell.identifier, for: indexPath) as! CompareTblVCell
    
        viewModel.navigate(cell:  cell, index: indexPath)
    }


}
