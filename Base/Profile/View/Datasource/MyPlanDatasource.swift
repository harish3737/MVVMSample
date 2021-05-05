//
//  MyPlanDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 21/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class MyPlanDataSource: NSObject, UITableViewDataSource {
    
    let viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: MyPlanTblVCell.identifier, for: indexPath) as! MyPlanTblVCell
        
        viewModel.setAttributedStr(lbl: cell.textLbl, index: indexPath)
        
        return cell
        
    }

}
