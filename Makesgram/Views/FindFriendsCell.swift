//
//  FindFriendsCell.swift
//  Makesgram
//
//  Created by Lily Li on 6/27/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import UIKit

class FindFriendsCell: UITableViewCell {
    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.layer.borderColor = UIColor.lightGray.cgColor
        followButton.layer.borderWidth = 1
        followButton.layer.cornerRadius = 6
        followButton.clipsToBounds = true
        
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitle("Following", for: .selected)
    }
    
    
    @IBAction func followButtonTapped(_ sender: Any) {
        print("follow button tapped")
    }
    
}
