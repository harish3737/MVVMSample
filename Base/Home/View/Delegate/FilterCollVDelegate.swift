//
//  FilterCollVDelegate.swift
//  Base
//
//  Created by Shyam Kumar on 05/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class FilterCollVDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let viewModel: HomeViewModel!
    
    init(vm: HomeViewModel) {
        self.viewModel = vm
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return viewModel.setFilterFlowLayout(collV: collectionView, layout: collectionViewLayout as! UICollectionViewFlowLayout)
        
    }
    
    
    
}
