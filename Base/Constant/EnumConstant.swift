//
//  EnumConstant.swift
//  Gron
//
//  Created by Abservetech on 11/03/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import Foundation

enum Gender : String{
    case female
    case male
}


// ENUM Chat Type

enum ChatType : Int {
    
    case single = 1
    case group = 2
    case media = 3
    
}

enum Language : String, CaseIterable {
    case english = "en"
    case arabic = "ar"
    
    var code : String {
        switch self {
        case .english:
            return "en"
        case .arabic:
            return "ar"
    }
    }
    
    var title : String {
        switch self {
        case .english:
            return StaticText.english
        case .arabic:
            return StaticText.arabic
       
        }
    }
    
      static var count: Int{ return 2 }
    }
    



//MARK:- Constant KEYS

//Defaults Keys

struct Keys {
    
    static let list = Keys()
    let userData = "userData"
    let idKey = "id"
    let accessToken = "accesstoken"
    let firstName = "firstName"
    let lastName = "lastName"
    let picture = "picture"
    let email = "email"
    let mobile = "mobile"
    let country_code = "country_code"
    let currency = "currency"
    let language = "language"
    let refreshToken = "refreshToken"
    let wallet = "wallet"
    let sos = "sos"
    let loginType = "LoginType"
    let appGroup = "group.tranxit.user"
    let isLoggedIn = "isLoggedIn"
    let dispacher = "dispacher"
    let cash = "cash"
    let card = "card"
    let payumoney = "payumoney"
    let paypal = "paypal"
    let paypal_adaptive = "paypal_adaptive"
    let braintree = "braintree"
    let paytm = "paytm"
    let measurement = "measurement"
    let stripe = "stripe"
    let referral_unique_id = "referral_unique_id"
    let referral_count = "referral_count"
    let referral_text = "referral_text"
    let referral_total_text = "referral_total_text"
    let otp = "otp"
    let ride_otp = "ride_otp"
    let qrcode_url = "qrcode_url"
}

