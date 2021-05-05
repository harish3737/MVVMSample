//
//  ProfileDetailTblVDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 23/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class ProfileDetailTblVDatasource: NSObject, UITableViewDataSource {
    
    let viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return viewModel.textArr.count
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileDetailTblVCell.identifier, for: indexPath) as! ProfileDetailTblVCell
        
        viewModel.setProfileDetail(cell: cell, index: indexPath)
        
        return cell
    }
    
    
    
    
    
    
}
