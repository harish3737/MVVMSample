//
//  FilterCollVDatasource.swift
//  Base
//
//  Created by Shyam Kumar on 05/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class FilterCollVDatasource: NSObject, UICollectionViewDataSource {
    
    let viemModel: HomeViewModel!
    
    init(vm: HomeViewModel) {
        self.viemModel = vm
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.viemModel.arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: XIB.Names.FavplaceCell, for: indexPath) as! FavplaceCell
        
        viemModel.setFilterData(index: indexPath, cell: collectionCell)
        return collectionCell
    }
    
}
