//
//  UserService.swift
//  Makesgram
//
//  Created by Lily Li on 6/23/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {

    static func create(_ firUser: FIRUser, username: String, completion: @escaping(User?) -> Void) {
    
        let userAttr = ["username": username]
        
        let ref = Database.database().reference().child("user").child(firUser.uid)
        ref.setValue(userAttr) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: {(snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
    
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
    
        let ref = Database.database().reference().child("user").child(uid)
        ref.observeSingleEvent(of: .value, with: {(snapshot) in
            guard let user = User(snapshot: snapshot) else{
                return completion(nil)
            }
            completion(user)
        })
        
        
    }
}
