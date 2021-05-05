

import UIKit


enum DateTimeFormatter : String{
    case Y_D_M = "yyyy-MM-dd"
    case YMD_T_HHSS = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case dYDM = "EEE,dd MMM yyyy"
    case DMY = "dd MMM YYYY"
    case MY = "MM/YYYY"
    case R_hour = "HH:mm"
    case N_hour = "hh:mm a"
    case date_time = "yyyy-MM-dd HH:mm"
    case date__time = "yyyy-MM-dd-HH:mm"
    case date_N_time = "yyyy-MM-dd hh:mm a"
    case N_date_time = "dd MMM , hh:mm a"
}


func showToast(msg : String ) {
    let window = UIApplication.shared.windows.first!
    let toastLabel = PaddingLabel()

    toastLabel.backgroundColor = UIColor.blackColor.withAlphaComponent(0.8)
    toastLabel.textColor = UIColor.whiteColor
    toastLabel.translatesAutoresizingMaskIntoConstraints = false
    toastLabel.textAlignment = .center;
    toastLabel.font = UIFont.systemFont(ofSize: 12)
    toastLabel.text = msg
    
    toastLabel.alpha = 1.0
    toastLabel.numberOfLines = 0
    toastLabel.lineBreakMode = .byWordWrapping
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    toastLabel.removeFromSuperview()
    window.addSubview(toastLabel)
    toastLabel.bringSubviewToFront(window)
    NSLayoutConstraint.activate([
        toastLabel.leadingAnchor.constraint(greaterThanOrEqualTo: window.leadingAnchor, constant: 20),
        toastLabel.trailingAnchor.constraint(lessThanOrEqualTo: window.trailingAnchor,constant: -20),
        toastLabel.bottomAnchor.constraint(greaterThanOrEqualTo: window.bottomAnchor, constant:  -15),
        toastLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
        toastLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 150),
        toastLabel.centerXAnchor.constraint(equalTo: window.centerXAnchor)
        
    ])
    UIView.animate(withDuration: 4.0, delay: 0.0, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}




//MARK:- Past or Future date
func relativePast(for date : Date?) -> String {
    
    guard let date = date else {
        return .Empty
    }
    
    let units = Set<Calendar.Component>([.year, .month, .day, .hour, .minute, .second, .weekOfYear])
    let components = Calendar.current.dateComponents(units, from: date, to: Date())
    
    if components.year! > 0 {
        return "\(components.year!) " + (components.year! > 1 ? "years ago" : "year ago")
        
    }
    else if components.month! > 0 {
        return "\(components.month!) " + (components.month! > 1 ? "months ago" : "month ago")
        
    }
    else if components.weekOfYear! > 0 {
        return "\(components.weekOfYear!) " + (components.weekOfYear! > 1 ? "weeks ago" : "week ago")
        
    }
    else if (components.day! > 0) {
        return (components.day! > 1 ? "\(components.day!) days ago" : "Yesterday")
        
    }
    else if components.hour! > 0 {
        return "\(components.hour!) " + (components.hour! > 1 ? "hours ago" : "hour ago")
        
    }
    else if components.minute! > 0 {
        return "\(components.minute!) " + (components.minute! > 1 ? "minutes ago" : "minute ago")
        
    }
    else {
        return "\(components.second!) " + (components.second! > 1 ? "seconds ago" : "second ago")
    }
}

func timeConvertor (time : String , _input: DateTimeFormatter, _output: DateTimeFormatter) -> String
   {
    if !time.isEmpty{
    var temp = time
    let strArr = time.split{$0 == ":"}.map(String.init)
        var hour : Int = 0
        var min : Int = 0
        if strArr.count >= 1{
            hour = Int(strArr[0]) ?? 0
          
        }
        if strArr.count >= 2{
            hour = Int(strArr[0]) ?? 0
             min = Int(strArr[1]) ?? 0
              
        }
      if(hour > 12){
        
          temp = "\((hour - 12)):\(min) " + "PM"
      }
      else{
          temp = temp + "AM"
      }
      return temp
    }
    return ""

   }
   
   func dateConvertor(_ date: String, _input: DateTimeFormatter, _output: DateTimeFormatter) -> String
   {
       let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = _input.rawValue
       let dates = dateFormatter.date(from: date)
      dateFormatter.dateFormat = _output.rawValue
    _ = dateFormatter.string(from: dates ?? Date())
       
       return  dateFormatter.string(from: dates ?? Date())
   }

func strToDate(_ strdate: String, _input: DateTimeFormatter, _output: DateTimeFormatter) -> Date{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = _input.rawValue
    _ = dateFormatter.date(from: strdate)
    dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone?
    dateFormatter.dateFormat = _output.rawValue
    return dateFormatter.date(from:strdate) ?? Date()
}

func getcurrentDateTime(formate : DateTimeFormatter) -> String{
       let date = Date()
       let formatter = DateFormatter()
      formatter.dateFormat = formate.rawValue
       let result = formatter.string(from: date)
       return result
   }

func getcurrentTime(formate : DateTimeFormatter = .N_hour) -> String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = formate.rawValue
    let result = formatter.string(from: date)
    return result
}

func convertDateformate_24_to12 (_ time : String ,_input: DateTimeFormatter, _output: DateTimeFormatter) -> String
 {
     let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = _input.rawValue
    dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: Int(+5.30)) as TimeZone?
     
     let date = dateFormatter.date(from: time)
     dateFormatter.dateFormat = _output.rawValue
     let datestr = dateFormatter.string(from: date ?? Date())
     
     return datestr
 }


//MARK:- Create a ChatID

func getChatId(with requestId : Int?) -> String {

    guard  let requestId = requestId else {
        return ProcessInfo().globallyUniqueString }

    return "\(requestId)" //userId <= providerId ? "u\(userId)_p\(providerId)" : "p\(providerId)_u\(userId)"

}

// @discardableResult func shadowApply(view:UIView) -> UIView{
//
//    let shadowSize : CGFloat = 0.3
//    let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2, y: -shadowSize / 2, width: view.frame.size.width + shadowSize, height: view.frame.size.height + shadowSize))
//    view.layer.masksToBounds = false
//    view.layer.shadowColor = UIColor.lightGray.cgColor
//    view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//    view.layer.shadowOpacity = 0.5
//    view.layer.shadowPath = shadowPath.cgPath
//    return view
//}

func attributedStrs(text1: String, text2: String, text3: String? = nil, attributes: [NSAttributedString.Key : Any]?,attributes2: [NSAttributedString.Key : Any]?, attributes3: [NSAttributedString.Key : Any]? = nil, lbl: UILabel){
    
    
    let attrString = NSMutableAttributedString(string: text1,
                                               attributes: attributes);

    attrString.append(NSMutableAttributedString(string: text2,
                                                attributes: attributes2));
    
    if text3 != nil {
        attrString.append(NSMutableAttributedString(string: text3 ?? "",
                                                    attributes: attributes3));
    }
    
    
    
    
    lbl.attributedText = attrString
    lbl.numberOfLines = 0
    
    
    
}

//MARK:- ShowLoader

internal func createActivityIndicator(_ uiView : UIView)->UIView{
    
    let container: UIView = UIView(frame: CGRect.zero)
    container.layer.frame.size = uiView.frame.size
    container.center = CGPoint(x: uiView.bounds.width/2, y: uiView.bounds.height/2)
    container.backgroundColor = UIColor(white: 0.2, alpha: 0.3)
    
    let loadingView: UIView = UIView()
    loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    loadingView.center = container.center
    loadingView.backgroundColor = .primaryColor//UIColor(white:0.1, alpha: 0.7)
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    loadingView.layer.shadowRadius = 5
    loadingView.layer.shadowOffset = CGSize(width: 0, height: 4)
    loadingView.layer.opacity = 2
    loadingView.layer.masksToBounds = false
    loadingView.layer.shadowColor = UIColor.gray.cgColor
    
    let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    actInd.clipsToBounds = true
    actInd.style = .large
    
    actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
    loadingView.addSubview(actInd)
    container.addSubview(loadingView)
    container.isHidden = true
    uiView.addSubview(container)
    actInd.startAnimating()
    
    return container
    
}

func applyShadowOnView(_ view: Any) {

    (view as AnyObject).layer.shadowColor = UIColor.darkGray.cgColor
    (view as AnyObject).layer.shadowOpacity = 0.3
//    (view as AnyObject).layer.shadowOffset = CGSize(width: 0, height: 2.5)
    (view as AnyObject).layer.shadowOffset = .zero
    (view as AnyObject).layer.shadowRadius = 3
    (view as AnyObject).layer?.masksToBounds = false
}

func applyBorderOnView(_ view: Any, color: UIColor) {

    (view as AnyObject).layer?.borderColor = color.cgColor
    (view as AnyObject).layer?.borderWidth = 0.7
    

}
//MARK:- Initilizing Number Formatter
private var numberFormatter : NumberFormatter?

private func initializeNumberFormatter(){
    
    if numberFormatter == nil {
        numberFormatter = NumberFormatter()
    }
}

extension UIViewController {
    func push(id : String, animation : Bool, sb: String){
        
         let vc = UIStoryboard.init(name: sb, bundle: nil).instantiateViewController(withIdentifier: id)
            self.navigationController?.pushViewController(vc, animated: animation)
        
        
    }
    
}


extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
