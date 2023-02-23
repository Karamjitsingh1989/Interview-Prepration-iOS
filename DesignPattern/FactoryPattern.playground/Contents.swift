import UIKit


protocol AuthProtocol {
    
    func signWith(email: String, password: String)-> Bool
}


enum AuthType {
    case FireBaseAuth
    case APIGEEAuth
}


struct APIGEEAuthUser: AuthProtocol {
    
    func signWith(email: String, password: String) -> Bool {
        
        if email.isEmpty || password.isEmpty {
            return false
        }
        return true
    }
}


struct FirebaseAuthUser: AuthProtocol {
    
    
    func signWith(email: String, password: String) -> Bool {
        if email.isEmpty {
            return false
        }
        return true
    }
}



struct AuthFactory  {
    
    static func getCurrentUser(auth:AuthType) -> AuthProtocol {
        switch auth {
        case .APIGEEAuth:
            return APIGEEAuthUser()
        case .FireBaseAuth:
            return FirebaseAuthUser()
        }
    }
}


let authType: AuthType = .FireBaseAuth

let auth =  AuthFactory.getCurrentUser(auth: authType)

auth.signWith(email: "karamjitsingh1989@gmail.com", password: "1234321")

