//
//  CompareTblVDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 16/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class CompareTblVDatasource: NSObject, UITableViewDataSource {
   
    var viewModel: HomeViewModel!
    
    init(vm: HomeViewModel) {
        viewModel = vm
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CompareTblVCell.identifier, for: indexPath) as! CompareTblVCell
        
        return cell
    }
    
    
    
    
}
