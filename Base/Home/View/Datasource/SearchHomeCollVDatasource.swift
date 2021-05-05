//
//  SearchHomeCollVDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 05/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class SearchHomeCollVDatasource: NSObject, UICollectionViewDataSource {
    
    
    let viewModel: HomeViewModel!
    
    init(vm: HomeViewModel) {
        self.viewModel = vm
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavplaceCell.identifier, for: indexPath) as! FavplaceCell
        
        viewModel.setData(index: indexPath, cell: cell)
        
        return cell
    }
 
}
