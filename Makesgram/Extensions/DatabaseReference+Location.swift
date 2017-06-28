//
//  DatabaseReference+Location.swift
//  Makesgram
//
//  Created by Lily Li on 6/28/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DatabaseReference {
    enum MGLocation{
        case root
        case posts(uid: String)
        
        func asDatabaseReference() -> DatabaseReference {
            let root = Database.database().reference()
            
            switch self {
            case .root:
                return root
            case .posts(let uid):
                return root.child("posts").child(uid)
            }
        }
    }
    
    static func toLocation(_ location: MGLocation) -> DatabaseReference{
        return location.asDatabaseReference()
    }
}
