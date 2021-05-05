//
//  SearchHomeCollVDelegate.swift
//  Base
//
//  Created by Shyam Kumar on 05/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit


class SearchHomeCollVDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let viewModel: HomeViewModel!
    
    init(vm: HomeViewModel) {
        self.viewModel = vm
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return viewModel.setFlowLayout(collV: collectionView, layout: collectionViewLayout as! UICollectionViewFlowLayout)
    
    }

}




