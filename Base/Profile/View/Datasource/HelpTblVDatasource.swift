//
//  HelpTblVDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class HelpTblVDatasource: NSObject, UITableViewDataSource {
    
    let viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.helpArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: HelpTableViewCell.identifier, for: indexPath) as! HelpTableViewCell
        
        cell.textLbl.text = viewModel.helpArr[indexPath.row]
        
//        viewModel.setAttributedStr(lbl: cell.textLbl, index: indexPath)
        
        return cell
        
    }

}



