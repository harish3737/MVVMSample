//
//  ProfileViewModel.swift
//  Base
//
//  Created by Shyam Kumar on 09/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation
import UIKit


class ProfileViewModel {
    
    
    var vc: UIViewController = UIViewController()
    
    var profileV: ProfileViewController?
    var myPlanVC: MyPlanViewController?
    var paymentVC: PaymentViewController?
    var HistoryVC: HistoryViewController?
    var helpVC: HelpViewController?
    var myAccountVC: MyAccountVC?
    
    init(vc: UIViewController) {
        self.vc = vc
    }
    
    var arr =  ["My Plan", "Payments", "Earn Searches", "History", "Help & Support"]
    
    var helpArr = ["1.What about refunds", "2.Does it work in every city?", "3. Can i buy a monthly subscription ?", "4. Do i get any free searches?", "5. When will mu credit card be changed"]
    
    var textArr = ["User Name", "Name", "Password", "About", "Home", "Work"]
    
    func setData(cell: ProfileTableViewCell, index: IndexPath) {
        
        cell.textLbl.text = arr[index.row]
    }
    
    func initalLoads(tblView: UITableView) {
        
       
        profileV = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.ProfileViewController) as? ProfileViewController
            tblView.register(ProfileTableViewCell.nib, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        
       
        profileV!.datasouce = ProfileTblVDatasource(vm: self)
        profileV!.delegate = ProfileTblVDelegate(vm: self)
        tblView.dataSource = profileV!.datasouce
        tblView.delegate = profileV!.delegate
        
//        searchPlace.delegate = SearchHomeCollVDelegate(vm: self)
        
//        searchPlace.collV.delegate = searchPlace.delegate
    }
    
    func navigate(cell: UITableViewCell, index: IndexPath, id: String) {
        
        
        vc.push(id: id, animation: true, sb: "Profile")
        
    }
    
    func initMyplan(tblV: UITableView) {
        
        
        myPlanVC = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.MyPlanViewController) as? MyPlanViewController
        tblV.register(MyPlanTblVCell.nib, forCellReuseIdentifier: MyPlanTblVCell.identifier)
         
        
        myPlanVC!.datasouce = MyPlanDataSource(vm: self)
        myPlanVC!.delegate = MyPlanTblVDelegate(vm: self)
        tblV.dataSource = myPlanVC!.datasouce
        tblV.delegate = myPlanVC!.delegate
        
    }
    
    func setAttributedStr(lbl: UILabel, index: IndexPath? = nil, toggle: Bool? = nil) {
        if toggle ?? false {
        let a = #colorLiteral(red: 0.9542174935, green: 0.3704305291, blue: 0.330014199, alpha: 1)
    
            let attrString = NSMutableAttributedString(string: (index!.row == 0) ?"Batch" : "Monthly subscription",
                                                   attributes: [ NSAttributedString.Key.foregroundColor: a ]);

            attrString.append(NSMutableAttributedString(string: (index!.row == 0) ? "\n\n5 Searches" : "\n\nUltimated",
                                                    attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]));
        
  
        
        
            attrString.append(NSMutableAttributedString(string: (index!.row == 0) ? "\n\nBuy ablock of 5searches at a time, automatically renews" : "\n\nEnjoy ultimate number of searches every month",
                                                    attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)]));
        
        
        lbl.attributedText = attrString
        lbl.numberOfLines = 0
            
        } else {
            
            let attrString = NSMutableAttributedString(string: "Share the link below!",
                                                       attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black ]);

            attrString.append(NSMutableAttributedString(string: "\nEnjoy a free search for each friend that sign up",
                                                        attributes: [ NSAttributedString.Key.foregroundColor: UIColor.black]));
            
      
            
            
            
            
            lbl.attributedText = attrString
            lbl.numberOfLines = 0
            

            
        }
//        lbl.setAttributedTitle(attrString, for: .normal)
//
//        btn.titleLabel?.numberOfLines = 0
    }
    
    func initalLoads(collV: UICollectionView) {
        
       
        paymentVC = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.PaymentViewController) as? PaymentViewController
        collV.register(PaymentCollVCell.nib, forCellWithReuseIdentifier: PaymentCollVCell.identifier)
        
       
        paymentVC?.datasource = PaymentCollVDatasource(vm: self)
        paymentVC!.delegate = PaymentCollVDelegate(vm: self)
         collV.dataSource = paymentVC!.datasource
        collV.delegate = paymentVC!.delegate
        

    }
    
    func setPaymentFlowLayout(collV: UICollectionView, layout: UICollectionViewFlowLayout)  -> CGSize{
        let flowLayout = layout
               let totalSpace = flowLayout.sectionInset.left
                   + flowLayout.sectionInset.right
                   + (flowLayout.minimumInteritemSpacing * CGFloat(4 - 1))
               let size = Int((collV.bounds.width - (totalSpace - 5)) / CGFloat(2))
               return CGSize(width: (size), height: 100)
    }
    
    func didselectCell(index: IndexPath, cell: ProfileTableViewCell) {
       
        switch index.row {
        case 0:
            self.navigate(cell: cell, index: index, id: Storyboard.Ids.MyPlanViewController)
        case 1:
            self.navigate(cell: cell, index: index, id: Storyboard.Ids.PaymentViewController)
        case 2:
            self.navigate(cell: cell, index: index, id: Storyboard.Ids.InviteReferalVC)
        case 3:
            self.navigate(cell: cell, index: index, id: Storyboard.Ids.HistoryViewController)
        case 4:
            self.navigate(cell: cell, index: index, id: Storyboard.Ids.HelpViewController)
        default:
            print("none")
        }
    
    }
    
    func setShadow(btn: UIButton, view: UIView) {
        let a = #colorLiteral(red: 1, green: 0.3593049645, blue: 0.3258514702, alpha: 1)
        applyBorderOnView(btn, color: a)
        applyBorderOnView(view, color: a)
        
    }
    
   
    func historyInitalLoads(tblView: UITableView) {


        HistoryVC = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.HistoryViewController) as? HistoryViewController

        tblView.register(HistoryTblVCell.nib, forCellReuseIdentifier: HistoryTblVCell.identifier)

        HistoryVC!.datasouce = HistoryTblVDatasource(vm: self)
        HistoryVC!.delegate = HistoryTblVDelegate(vm: self)
        tblView.dataSource = HistoryVC!.datasouce
       tblView.delegate = HistoryVC!.delegate

//        searchPlace.delegate = SearchHomeCollVDelegate(vm: self)

//        searchPlace.collV.delegate = searchPlace.delegate
    }
    
    func helpInitalLoads(tblView: UITableView, views: [UIView]) {

        helpVC = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.HelpViewController) as? HelpViewController

        tblView.register(HelpTableViewCell.nib, forCellReuseIdentifier: HelpTableViewCell.identifier)

        helpVC!.datasource = HelpTblVDatasource(vm: self)
        tblView.dataSource = helpVC!.datasource

        helpVC!.delegate = HelpTblVDelegate(vm: self)
        tblView.delegate = helpVC!.delegate
        views.forEach { (i) in
            applyShadowOnView(i)
        }
        

    }
    
    func setProfileDetail(cell: ProfileDetailTblVCell, index: IndexPath) {
        
        let data = self.textArr[index.row]
       
        let attributes = [ NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let attributes2 = [ NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        attributedStrs(text1: data, text2: "\n\ntest", attributes: attributes,attributes2: attributes2, lbl: cell.contentLbl)
        
    }
    
    func myAccountInitialLoads(tblV: UITableView, lbl: UILabel) {
        
        
        myAccountVC = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: Storyboard.Ids.MyAccountVC) as? MyAccountVC

        tblV.register(ProfileDetailTblVCell.nib, forCellReuseIdentifier: ProfileDetailTblVCell.identifier)

        myAccountVC!.datasource = ProfileDetailTblVDatasource(vm: self)
        tblV.dataSource = myAccountVC!.datasource
         myAccountVC!.delegate = ProfileDetailTblVDelegate(vm: self)
        tblV.delegate = myAccountVC!.delegate
        let attributes = [ NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let attributes2 = [ NSAttributedString.Key.foregroundColor: UIColor.darkGray,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        attributedStrs(text1: "Iron Man", text2: "\n1234567890", attributes: attributes, attributes2: attributes2, lbl: lbl)
        
//        helpVC!.delegate = HelpTblVDelegate(vm: self)
//        tblView.delegate = helpVC!.delegate
       
        
    }
    
    func navToMyAccount(imgView: UIImageView, ViewController: UIViewController) {
        imgView.addTap {
            ViewController.push(id: Storyboard.Ids.MyAccountVC, animation: true, sb: "Profile")
        }
    }
    
}
