//
//  PaymentCollVDelegate.swift
//  Base
//
//  Created by Shyam Kumar on 22/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class PaymentCollVDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let viewModel: ProfileViewModel!
    
    init(vm: ProfileViewModel) {
        self.viewModel = vm
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return viewModel.setPaymentFlowLayout(collV: collectionView, layout: collectionViewLayout as! UICollectionViewFlowLayout)
        
    }
    
    
    
}
