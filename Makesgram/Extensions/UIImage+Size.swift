//
//  UIImage+Size.swift
//  Makesgram
//
//  Created by Lily Li on 6/26/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
