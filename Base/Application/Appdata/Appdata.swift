//
//  Appdata.swift
//  Base
//
//  Created by Basha's MacBook Pro on 25/03/21.
//  Copyright © 2021 AppleMac. All rights reserved.
//

import Foundation

let AppName = "Appname"

struct Api {
    static let baseURL = "https://rss.itunes.apple.com/api/"
}

var deviceTokenString = "No Device"
let stripePublishableKey = ""
var googleMapKey = "AIzaSyDSMf2fEwC7xsGoIWex_xk7bVjLzAxiSwI"
let appSecretKey = ""
let appClientId = 2
var supportNumber = "1111"
var supportEmail = "support@.com"
var offlineNumber = ""
let helpSubject = "\(AppName) Help"
let defaultMapLocation = LocationCoordinate(latitude: 13.009245, longitude: 80.212929)
let requestInterval : TimeInterval = 60
let requestCheckInterval : TimeInterval = 5
let driverBundleID = ""
var isReferalEnable = 0
 

// AppStore URL

enum AppStoreUrl : String {
    
    case user = ""
    case driver = "-"
    
}
