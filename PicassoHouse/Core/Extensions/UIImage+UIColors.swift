//
//  UIImage+UIColors.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 26/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func withColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0, y: self.size.height)
        context!.scaleBy(x: 1.0, y: -1.0)
        context!.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context!.clip(to: rect, mask: self.cgImage!)
        context!.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage.withRenderingMode(.alwaysOriginal)
    }
}
