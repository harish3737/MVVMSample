


import Foundation
import UIKit
import Lottie


private var AssociatedObjectHandle: UInt8 = 25
private var ButtonAssociatedObjectHandle: UInt8 = 10
var selectedLanguage : Language = .english

public enum closureActions : Int{
    case none = 0
    case tap = 1
    case swipe_left = 2
    case swipe_right = 3
    case swipe_down = 4
    case swipe_up = 5
}

public struct closure {
    typealias emptyCallback = ()->()
    static var actionDict = [Int:[closureActions : emptyCallback]]()
    static var btnActionDict = [Int:[String: emptyCallback]]()
}

extension UIView{
    
    var closureId:Int{
        get {
            let value = objc_getAssociatedObject(self, &AssociatedObjectHandle) as? Int ?? Int()
            return value
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addTap(Action action:@escaping ()->Void){
        self.actionHandleBlocks(.tap,action:action)
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(triggerTapActionHandleBlocks))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
    }
    
    func actionHandleBlocks(_ type : closureActions = .none,action:(() -> Void)? = nil) {
        
        if type == .none{
            return
        }
        var actionDict : [closureActions : closure.emptyCallback]
        if self.closureId == Int(){
            self.closureId = closure.actionDict.count + 1
            closure.actionDict[self.closureId] = [:]
        }
        if action != nil {
            actionDict = closure.actionDict[self.closureId]!
            actionDict[type] = action
            closure.actionDict[self.closureId] = actionDict
        } else {
            let valueForId = closure.actionDict[self.closureId]
            if let exe = valueForId![type]{
                exe()
            }
        }
    }
    
    @objc func triggerTapActionHandleBlocks() {
        self.actionHandleBlocks(.tap)
    }
}


// MARK: - custom UI appearance

extension UIView{
    
    var identifiers : String{
          return "\(self)"
      }
    
    @objc func initView(view: UIView , vc : UIViewController) -> UIView{
          return self
      }
    
    @objc func deInitView(view: UIView , vc : UIViewController) -> UIView{
        removeFromSuperview()
        return self
    }
    
    func asImage() -> UIImage {
      let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image(actions: { rendererContext in
          layer.render(in: rendererContext.cgContext)
      })
    }
    
    func blurView(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.5
        self.addSubview(blurEffectView)
    }
    
 
    
    func shadowCorner(_ corners: CACornerMask, radius: CGFloat,shadow With : Int = 2) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
        self.layer.shadowColor = UIColor.grayColor.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: With)
        self.layer.shadowRadius = CGFloat(With)
        self.layer.masksToBounds = false
    }
    
    var Elevation : Int{
        set{
            self.layer.shadowColor = UIColor.primaryColor.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 0, height: newValue)
            self.layer.shadowRadius = CGFloat(newValue)
            self.layer.masksToBounds = false
            self.layer.cornerRadius = 10
        }
        get{
            return Int(self.layer.shadowRadius)
        }
    }
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
    func setCorneredElevation(shadow With : Int = 2 , corner radius : Int = 20 , color : UIColor = UIColor.primaryColor , clipstobound : YesNoType = .no){
        self.layer.masksToBounds = false
        self.clipsToBounds = clipstobound == .no ? false : true
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: With, height: With)
        self.layer.shadowRadius = CGFloat(With)
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    func setGradientLayer(colorsuperTop : UIColor ,colorTop : UIColor , colormiddle : UIColor , colorBottom : UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: -10, y: 0, width: self.frame.width + 10, height: self.frame.height + 70)
        gradientLayer.colors = [colorsuperTop.cgColor,colorTop.cgColor, colormiddle.cgColor, colorBottom.cgColor]
        self.layer.addSublayer(gradientLayer)
        self.backgroundColor = .clear
    }
    
    func setGradientLayer(colorTop : UIColor , colormiddle : UIColor , colorBottom : UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: -10, y: 0, width: self.frame.width + 10, height: self.frame.height + 70)
        gradientLayer.colors = [colorTop.cgColor, colormiddle.cgColor, colorBottom.cgColor]
        self.layer.addSublayer(gradientLayer)
        self.backgroundColor = .clear
    }
    
    
    func addDashedBorder(color : UIColor = .red) {
        let color = color.cgColor

       let shapeLayer:CAShapeLayer = CAShapeLayer()
       let frameSize = self.frame.size
       let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

       shapeLayer.bounds = shapeRect
       shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
       shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
       shapeLayer.lineWidth = 1
       shapeLayer.lineJoin = CAShapeLayerLineJoin.round
       shapeLayer.lineDashPattern = [6,3]
       shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

       self.layer.addSublayer(shapeLayer)
       }
    
    
    func setText(_ textKey : String , _ size : Int = 16 , fontStyle type : FontType = .regular , textColor color : UIColor = UIColor.blackColor){
       
        let viewType = self
        let font = UIFont(name: type.rawValue, size: CGFloat(size))

        switch (viewType.self) {
        case is UITextField:
            (viewType as? UITextField)?.font = font
            (viewType as? UITextField)?.text = textKey
            (viewType as? UITextField)?.textColor = color
            if [NSTextAlignment.left, .right].contains((viewType as! UITextField).textAlignment) {
                (viewType as? UITextField)?.textAlignment = (selectedLanguage == .arabic) ? .right : .left
            }
        case is UILabel:
            (viewType as? UILabel)?.font = font//UIFont(name: isTitle ? FontCustom.avenier_Heavy.rawValue : FontCustom.avenier_Medium.rawValue, size: customSize)
            (viewType as? UILabel)?.text = textKey
            (viewType as? UILabel)?.textColor = color
            if [NSTextAlignment.left, .right].contains((viewType as! UILabel).textAlignment) {
                (viewType as? UILabel)?.textAlignment = (selectedLanguage == .arabic) ? .right : .left
            }
            
        case is UIButton:
            (viewType as? UIButton)?.titleLabel?.font = font
            (viewType as? UIButton)?.setTitle(textKey, for: .normal)
            (viewType as? UIButton)?.setTitleColor(color, for: .normal)
            if [UIControl.ContentHorizontalAlignment.left, .right].contains((viewType as! UIButton).contentHorizontalAlignment) {
                (viewType as! UIButton).contentHorizontalAlignment = (selectedLanguage == .arabic) ? .right : .left
            }
        case is UITextView:
            (viewType as? UITextView)?.font = font
            (viewType as? UITextView)?.text = textKey
            (viewType as? UITextView)?.textColor = color
            //(field as? UITextView)?.textAlignment = (selectedLanguage == .arabic && (field as! UITextView).textAlignment == .left) ? .right : .left
        default:
            break
        }
       

      }
    
    
    
    
//    func setUpFloatingTxt(textFeild : RYFloatingInput , placeHolder : String = "" , info : String = "" , error : String = "" , inputype : inputType = .none , isPassword : YesNoType = .no, callBack : @escaping() -> () ){
//
//        //MARK: - Sample code
////        self.phoneView.setUpFloatingTxt(textFeild: self.phoneNumTxt, placeHolder: "Phone", info: "Phone", error: "", inputype: .phoneNumber, isPassword: .no,callBack: {
////                  self.phoneNumTxt.becomeFirstResponder()
////              })
//
//        var passwordType : Bool = false
//        var isNumeberType : RYFloatingInput.InputType
//        var inputError : String = ""
//
//        switch isPassword {
//        case YesNoType.no:
//            passwordType = false
//        case YesNoType.yes :
//            passwordType = true
//
//        }
//
//        switch inputype {
//        case inputType.none:
//            isNumeberType = .regex(pattern: "[A-Z0-9a-Z]")
//            inputError = "_invalid_formate"
//        case inputType.phoneNumber :
//            isNumeberType = .number
//             inputError = "_invalid_num_formate"
//
//        case .password:
//            isNumeberType = .regex(pattern: "[A-Z0-9a-z.!@#$%^&*()]")
//            inputError = "_invalid_formate"
//        case .email:
//            isNumeberType = .regex(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
//            inputError = "_invalid_email_formate"
//        }
//
//        var newFloatingText = textFeild
//        newFloatingText = RYFloatingInput(frame: self.bounds)
//
//
//        let setting = RYFloatingInputSetting.Builder.instance()
//            .placeholer(placeHolder)
//            .inputType(isNumeberType, onViolated: (message: inputError.localize, callback: {
//
//            }))
//        .maxLength(1, onViolated: (message: inputError.localize, callback: {
//            callBack()
//        }))
//            .backgroundColor(UIColor.systemBackground)
//            .textColor(UIColor.label)
//            .accentColor(UIColor.primaryColor)
//            .secure(passwordType)
//            .build()
//
//        newFloatingText.setup(setting: setting)
//        self.addSubview(newFloatingText)
//    }
}

 

class SZView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circleView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.circleView()
    }
    
    func circleView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.contentMode = .scaleToFill
        self.layer.backgroundColor = UIColor.yellow.cgColor
        if #available(iOS 13.0, *) {
            self.layer.borderColor = UIColor.black.cgColor
        } else {
            self.layer.borderColor = UIColor.yellow.cgColor
        }
        self.layer.borderWidth = 1
    }
}

class SZCountView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circleView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.circleView()
    }
    
    func circleView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.contentMode = .scaleToFill
        self.layer.backgroundColor = UIColor.whiteColor.cgColor
        if #available(iOS 13.0, *) {
            self.layer.borderColor = UIColor.black.cgColor
        } else {
            self.layer.borderColor = UIColor.grayColor.cgColor
        }
        self.layer.borderWidth = 0.5
    }
}

class szWhiteCircle : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circleView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.circleView()
    }
    
    func circleView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.contentMode = .scaleToFill
        self.layer.backgroundColor = UIColor.white.withAlphaComponent(1).cgColor
         self.layer.borderColor = UIColor.white.cgColor
      
        self.layer.borderWidth = 0.4
    }
}

class SZGrayCircleView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circleView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.circleView()
    }
    
    func circleView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.contentMode = .scaleToFill
        self.layer.backgroundColor = UIColor.grayColor.withAlphaComponent(0.8).cgColor
         self.layer.borderColor = UIColor.white.cgColor
      
        self.layer.borderWidth = 0.4
    }
}

class SZAppColorCircleView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circleView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.circleView()
    }
    
    func circleView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.contentMode = .scaleToFill
        self.layer.backgroundColor = UIColor.primaryColor.withAlphaComponent(0.9).cgColor
         self.layer.borderColor = UIColor.white.cgColor
      
        self.layer.borderWidth = 0.4
    }
}
