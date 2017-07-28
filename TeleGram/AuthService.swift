//
//  AuthService.swift
//  TeleGram
//
//  Created by Konstantine Piterman on 7/26/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage().reference()

typealias Completion = (_ errMsg: String?,_ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    
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
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            //successfully logged in
                                                  onComplete?(nil, user)
                                                }
                                            }
                                        )
                                    }
                                }
                            }
                        )
                    }
            
                } else {
                    //handle all other errors
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                //successfully logged in
                onComplete?(nil, user)
            }
           }
        )
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
            case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
                onComplete?("Email in use", nil)
                break
                
            default:
                onComplete?("There was a problem authenticating. Try again", nil)
                
                //handles the possible errors with email authentication
            }
        }
    }
    
    var REF_USER_CURRENT: DatabaseReference {
        let uid = KeychainWrapper.standard.string(forKey: KEY_UID)
        let user = _REF_USERS.child(uid!)
        return user
    }
    
    func createFirbaseDBUser(uid: String, userData: Dictionary<String, String>) {
        _REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
}
