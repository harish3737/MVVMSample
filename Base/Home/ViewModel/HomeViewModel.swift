//
//  HomeViewModel.swift
//  Base
//
//  Created by Shyam Kumar on 05/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var vc: UIViewController = UIViewController()
    var isDismiss: ((Bool) -> Void)?
    var popupVC: ContinuePopUpVC?
    var searchPlace: SearchHomeView?
    var compareview: compareView?
    let arr = ["Home","Work","Place3","Place4"]
    let headers = ["Providers","Seating","Cartype"]
    
    
    
    init(vc: UIViewController) {
        self.vc = vc
    }
    
    func profileNav(){
        vc.push(id: Storyboard.Ids.ProfileViewController, animation: true, sb: "Profile")
    }
    
    func searchV() {
        searchPlace = SearchHomeView().loadNib() as? SearchHomeView
        searchPlace?.frame = CGRect(origin: CGPoint(x: 0, y: vc.view.frame.height-(searchPlace?.frame.height)!), size: CGSize(width: vc.view.frame.width, height: (searchPlace?.frame.height)!))
        searchPlace?.clipsToBounds = false
        searchPlace?.datasouce = SearchHomeCollVDatasource(vm: self)
        searchPlace?.delegate = SearchHomeCollVDelegate(vm: self)
        searchPlace?.collV.dataSource = searchPlace?.datasouce
        
        searchPlace?.collV.delegate = searchPlace?.delegate
        searchPlace?.imgV.addTap {
            self.profileNav()
        }
        
        
        searchPlace?.Search = { [weak self] in

            self?.searchPlace?.removeFromSuperview()
          
        let confirmView = ConfirmLocationView().loadNib()  as! ConfirmLocationView
            confirmView.frame = CGRect(origin: CGPoint(x: 0, y: self!.vc.view.frame.height-confirmView.frame.height), size: CGSize(width: self!.vc.view.frame.width, height: confirmView.frame.height))
            confirmView.clipsToBounds = false

            confirmView.Confirm = { [weak self] in


                confirmView.removeFromSuperview()

                let Filterview = FilterView().loadNib() as! FilterView

                Filterview.frame = CGRect(origin: CGPoint(x: 0, y: self!.vc.view.frame.height-Filterview.frame.height), size: CGSize(width: self!.vc.view.frame.width, height: Filterview.frame.height))
                Filterview.clipsToBounds = false
                
                Filterview.datasouce = FilterCollVDatasource(vm: self!)
                Filterview.delegate = FilterCollVDelegate(vm: self!)
                Filterview.filterCollection.dataSource = Filterview.datasouce
                
                Filterview.filterCollection.delegate = Filterview.delegate


                Filterview.Apply = { [weak self] in


                    Filterview.removeFromSuperview()
                    Filterview.filterCollection.dataSource = nil
                    Filterview.filterCollection.delegate = nil

                    self?.compareview = compareView().loadNib() as? compareView

                    self!.compareview?.frame = CGRect(origin: CGPoint(x: 0, y: self!.vc.view.frame.height-self!.compareview!.frame.height), size: CGSize(width: self!.vc.view.frame.width, height: self!.compareview!.frame.height))
                    self?.compareview?.clipsToBounds = false
                    
                    self?.compareview?.datasouce = CompareTblVDatasource(vm: self!)
                    self!.compareview?.delegate = CompareTblVDelegate(vm: self!)
                    
                    self!.compareview?.tblV.dataSource = self!.compareview?.datasouce
                    self!.compareview?.tblV.delegate = self!.compareview?.delegate

                    self!.vc.view.addSubview(self!.compareview!)
                }

                self!.vc.view.addSubview(Filterview)
            }


            self!.vc.view.addSubview(confirmView)

        }
        vc.view.addSubview(searchPlace!)
    }
    
    func setData(index: IndexPath, cell: FavplaceCell) {
        
        cell.textLbl.text = self.arr[index.row]
                

                cell.textLbl.layer.cornerRadius = 15
//                applyShadowOnView(cell.textLbl ?? UILabel())
//
//                cell.textLbl.layer.masksToBounds = true
        
    }
    
    func setFlowLayout(collV: UICollectionView, layout: UICollectionViewFlowLayout)  -> CGSize{
        let flowLayout = layout
               let totalSpace = flowLayout.sectionInset.left
                   + flowLayout.sectionInset.right
                   + (flowLayout.minimumInteritemSpacing * CGFloat(4 - 1))
               let size = Int((collV.bounds.width - totalSpace) / CGFloat(2))
               return CGSize(width: (size), height: 50)
    }
    
    
    func setFilterData(index: IndexPath, cell: FavplaceCell) {
        
        cell.textLbl.text = self.arr[index.row]
    

                cell.textLbl.layer.cornerRadius = 15
                applyShadowOnView(cell.textLbl ?? UILabel())
        
                cell.textLbl.layer.masksToBounds = true
        
    }
    
    func setFilterFlowLayout(collV: UICollectionView, layout: UICollectionViewFlowLayout)  -> CGSize{
        let flowLayout = layout
               let totalSpace = flowLayout.sectionInset.left
                   + flowLayout.sectionInset.right
                   + (flowLayout.minimumInteritemSpacing * CGFloat(4 - 1))
               let size = Int((collV.bounds.width - totalSpace) / CGFloat(2))
               return CGSize(width: (size), height: 50)
    }
    
    
    func applyShadowOnView(_ view: Any) {

        (view as AnyObject).layer.shadowColor = UIColor.darkGray.cgColor
        (view as AnyObject).layer.shadowOpacity = 1
        (view as AnyObject).layer.shadowOffset = CGSize.zero
        (view as AnyObject).layer.shadowRadius = 2

    }
    
    func navigate(cell: CompareTblVCell, index: IndexPath) {
        
        vc.push(id: Storyboard.Ids.MyPlanVC, animation: true, sb: "Home")
        self.compareview?.removeFromSuperview()
        
    }
    
    @objc func continuePopV() {
        
        popupVC = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.ContinuePopUpVC) as? ContinuePopUpVC
//        self.isDismiss = { [weak self] (bool) in
//            if bool {
//                self!.vc.navigationController?.popViewController(animated: true)
//            }
//        }
        NotificationCenter.default.addObserver(self, selector: #selector(popUpDismiss(notification:)), name: NSNotification.Name("dissmissPopV"), object: nil)
        popupVC?.modalPresentationStyle = .overCurrentContext
        vc.navigationController?.present(popupVC ?? UIViewController(), animated: true, completion: nil)
        
    }
    
   @objc func dismissPopUp() {
   
    popupVC = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.ContinuePopUpVC) as? ContinuePopUpVC
   
        vc.dismiss(animated: true, completion: nil)
    NotificationCenter.default.post(name: NSNotification.Name("dissmissPopV"), object: nil)

     }
    
    @objc func popUpDismiss(notification: NSNotification) {
    
        self.vc.navigationController?.popViewController(animated: true)
       
      }
    
}
