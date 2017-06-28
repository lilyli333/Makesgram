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
        case showPosts(uid: String, postKey: String)
        
        case user
        case showUser(uid: String)
        
        case timeLine(uid: String)
        
        case followers(uid: String)
        
        case likes(postKey: String, currentID: String)
        case isLiked(postKey: String)
        case likesCount(posterUID: String, postKey: String)
        
        func asDatabaseReference() -> DatabaseReference {
            let root = Database.database().reference()
            
            switch self {
            case .root:
                return root
            case .posts(let uid):
                return root.child("posts").child(uid)
            case .showPosts(let uid, let posterKey):
                return root.child("posts").child(uid).child(posterKey)
            case .user:
                return root.child("user")
            case .showUser(let uid):
                return root.child("user").child(uid)
            case .timeLine(let uid):
                return root.child("timeline").child(uid)
            case .followers(let uid):
                return root.child("followers").child(uid)
            case .likes(let postKey, let currentID):
                return root.child("postLikes").child(postKey).child(currentID)
            case .likesCount(let posterUID, let postKey):
                return root.child("posts").child(posterUID).child(postKey).child("likes_count")
            case .isLiked(let postKey):
                return root.child("postLikes/\(postKey)")
            }
        }
    }
    
    static func toLocation(_ location: MGLocation) -> DatabaseReference{
        return location.asDatabaseReference()
    }
}
