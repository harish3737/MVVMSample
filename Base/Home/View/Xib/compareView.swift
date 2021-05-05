//
//  compareView.swift
//  CompareYourFare
//
//  Created by CSS on 24/03/21.
//

import UIKit

class compareView: UIView {

    var datasouce: CompareTblVDatasource!
    var delegate: CompareTblVDelegate!
    
    @IBOutlet weak var tblV: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        tblV.register(CompareTblVCell.nib, forCellReuseIdentifier: CompareTblVCell.identifier)
        
        
    }

}
