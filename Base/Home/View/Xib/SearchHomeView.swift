//
//  SearchHomeView.swift
//  CompareYourFare
//
//  Created by CSS on 24/03/21.
//

import UIKit

class SearchHomeView: UIView {
   
    

    
    var Search : (()->Void)?

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var collV: UICollectionView!
    
    var viewModel: HomeViewModel!
    var datasouce: SearchHomeCollVDatasource!
    var delegate: SearchHomeCollVDelegate!
    
    let arr = ["Home","Work","Place3","Place4"]
    
    @IBOutlet weak var imgV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyShadowOnView(searchTextField ?? UITextField())
        
        collV.register(FavplaceCell.nib, forCellWithReuseIdentifier: FavplaceCell.identifier)
        
        
        
    }
    
    
  
    func applyShadowOnView(_ view: Any) {

//        (view as AnyObject).layer.cornerRadius = 8
//        self.layer.masksToBounds = true
        (view as AnyObject).layer.shadowColor = UIColor.darkGray.cgColor
        (view as AnyObject).layer.shadowOpacity = 1
        (view as AnyObject).layer.shadowOffset = CGSize.zero
        (view as AnyObject).layer.shadowRadius = 2

    }

    
    
    @IBAction func SearchClickEvent(_ sender: Any) {
        
        self.Search?()
        
  
    }
    
}

 
