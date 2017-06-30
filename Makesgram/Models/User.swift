//
//  User.swift
//  Makesgram
//
//  Created by Lily Li on 6/22/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class User: NSObject {
    
    var isFollowed = false
    
    var followerCount: Int?
    var followingCount: Int?
    var postCount: Int?

    // MARK: - Singleton
    private static var _current: User?
    static var current: User {
        guard let currentUser = _current else{
            fatalError("Error: current user doesn't exist")
        }
        return currentUser
    }
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
        super.init()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String,
            let followerCount = dict["follower_count"] as? Int,
            let followingCount = dict["following_count"] as? Int,
            let postCounts = dict["post_count"] as? Int
            else {
                return nil}
        
        self.uid = snapshot.key
        self.username = username
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.postCount = postCounts
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String
            else { return nil }
        self.postCount = 0
        self.uid = uid
        self.username = username
        
        super.init()
    }
    
    //MARK: -Class Methods
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        _current = user
    }
}

extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
    }
}

