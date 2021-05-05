//
//  PaymentCollVDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class PaymentCollVDatasource: NSObject, UICollectionViewDataSource {
   
    let viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentCollVCell.identifier, for: indexPath) as! PaymentCollVCell
        
//        viewModel.setData(index: indexPath, cell: cell)
        
        return cell
    }
 
}

