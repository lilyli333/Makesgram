//
//  ProfileHeaderView.swift
//  Makesgram
//
//  Created by Lily Li on 6/29/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView{
    
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    
    weak var delegate: ProfileHeaderViewDelegate?
    
    @IBOutlet weak var settingButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        settingButton.layer.cornerRadius = 6
        settingButton.layer.borderColor = UIColor.lightGray.cgColor
        settingButton.layer.borderWidth = 1
    }
    
    
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        delegate?.didTapSettingsButton(sender, on: self)
    }
}
