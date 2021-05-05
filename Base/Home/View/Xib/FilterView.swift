//
//  FilterView.swift
//  CompareYourFare
//
//  Created by CSS on 24/03/21.
//

import UIKit

class FilterView: UIView{

    
    @IBOutlet weak var filterCollection: UICollectionView!
    
    
    var Apply : (()->Void)?
    
    var viewModel: HomeViewModel!
    var datasouce: FilterCollVDatasource!
    var delegate: FilterCollVDelegate!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        filterCollection.register(FavplaceCell.nib, forCellWithReuseIdentifier: FavplaceCell.identifier)
//        filterCollection.delegate = self
//        filterCollection.dataSource = self
        
        
    }
  

    
    
    @IBAction func applyClickEvennt(_ sender: Any) {
        
        
        self.Apply?()
        
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 3
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        return self.getCellFor(itemAt: indexPath)
//    }
    
//    private func getCellFor(itemAt indexPath : IndexPath)->UICollectionViewCell{
//
//        if let collectionCell = self.filterCollection.dequeueReusableCell(withReuseIdentifier: XIB.Names.FavplaceCell, for: indexPath) as? FavplaceCell {
//
//
//            return collectionCell
//        }
//
//        return UICollectionViewCell()
//    }
    
    

}
