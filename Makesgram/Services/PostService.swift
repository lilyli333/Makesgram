//
//  PostService.swift
//  Makesgram
//
//  Created by Lily Li on 6/23/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    
    private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
        let currentUser = User.current
        let post = Post(imageURL: urlString, imageHeight: aspectHeight)
        let dict = post.dictValue
        let postRef = Database.database().reference().child("posts").child(currentUser.uid).childByAutoId()
        postRef.updateChildValues(dict)
    }
    
    static func create(for image: UIImage) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            let aspectHeight = image.aspectHeight
            create(forURLString: urlString, aspectHeight: aspectHeight)
        }
    }
}
