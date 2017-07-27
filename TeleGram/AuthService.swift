//
//  AuthService.swift
//  TeleGram
//
//  Created by Konstantine Piterman on 7/26/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?,_ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    func login(email: String, password: String, onComplete: Completion?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    
                    if errorCode == .userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                
                                //show error
                            } else {
                                if user?.uid != nil {
                                    //Sign in
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error)
                                        in
                                        if error != nil {
                                            //show error to user
                                        } else {
                                            //we have successfully logged in
                                        }
                                    })
                            }
                        }
                                   
                        })
                        
                    }
            
                } else {
                    //handle all other errors
                }
            } else {
                //successfully logged in
            }
            
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = AuthErrorCode(rawValue: error.code) {
            switch (errorCode) {
            case .invalidEmail:
                onComplete?("Invalid email address", nil)
                break
            case .wrongPassword:
                onComplete?("Invalid password", nil)
                break
            default:
                onComplete?("There was a problem authenticating. Try again", nil)
                
                //handles the possible errors with email authentication
            }
        }
    }
    
}
