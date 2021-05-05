//
//  HomeViewController.swift
//  Base
//
//  Created by Shyam Kumar on 05/04/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel!
    
     let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapV: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel = HomeViewModel(vc: self)
        viewModel.searchV()
       
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    }

}

extension HomeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else{
            return
        }
        
        locationManager.startUpdatingLocation()
        mapV.isMyLocationEnabled = true
        mapV.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        mapV.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
    }
    
}
