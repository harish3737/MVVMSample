
import Foundation

struct HttpError{
    static let noInternet = "Please check your internet connection"
    static let apiConnection = "Check api Method, network connetion , this error from app side only"
    static let serverError = "Api server Error , Check with backend Geeks"
    static let somthingWentWrong = "SomeThing Went Wrong"
}


extension Int{
    func isResponseOK() -> Bool{
        return (200...299).contains(self)
    }
}
