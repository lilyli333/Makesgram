//
//  PostHeaderCell.swift
//  Makesgram
//
//  Created by Lily Li on 6/26/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    static let height: CGFloat = 54
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionButtonTapped(_ sender: Any) {
        print("option button was pressed")
    }
}
