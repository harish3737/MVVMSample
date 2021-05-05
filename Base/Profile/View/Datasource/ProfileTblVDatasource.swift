//
//  ProfileTblVDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 09/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit




class ProfileTblVDatasource: NSObject, UITableViewDataSource {
    
    let viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        
        viewModel.setData(cell: cell, index: indexPath)
        
        return cell
        
    }

}
