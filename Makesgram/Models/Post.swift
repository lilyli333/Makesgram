//
//  Post.swift
//  Makesgram
//
//  Created by Lily Li on 6/23/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Post{
    var key: String?
    let imageURL: String
    let imageHeight: CGFloat
    let creationDate: Date
    
    var dictValue: [String: Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["imageURL" : imageURL,
                "image_height": imageHeight,
                "createdAt": createdAgo]
    }
    
    init(imageURL: String, imageHeight: CGFloat) {
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let imageURL = dict["imageURL"] as? String,
            let imageHeight = dict["image_height"] as? CGFloat,
            let createdAgo = dict["createdAt"] as? TimeInterval
            else { return nil }
        
        self.key = snapshot.key
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
    }
    
}
