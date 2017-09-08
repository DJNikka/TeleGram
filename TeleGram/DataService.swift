//
//  DataService.swift
//  TeleGram
//
//  Created by Konstantine Piterman on 7/27/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import Foundation
import FirebaseDatabase
import SwiftKeychainWrapper
import FirebaseStorage

let FIR_CHILD_USERS = "users"

let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage().reference()


class DataService {
    private static let _instance = DataService()
    
        private var _REF_BASE = DB_BASE
        private var _REF_USERS = DB_BASE.child("users")
    
    static var instance: DataService {
        return _instance
    }
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var mainStorageRef: StorageReference {
        return Storage.storage().reference(forURL: "gs://telegram-22ca9.appspot.com")
    }
    
    var imagesStorageRef: StorageReference {
        
        return mainStorageRef.child("images")
    }
    
    
    var videoStorageRef: StorageReference {
        
        return mainStorageRef.child("videos")
    }
    
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child(FIR_CHILD_USERS).child(uid).child("profile").setValue(profile)
    }

    var usersRef: DatabaseReference {
    return mainRef.child("users")
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
