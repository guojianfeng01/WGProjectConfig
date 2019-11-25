//
//  UIImage+Hys.swift
//  HYS3
//
//  Created by 郭建峰 on 11/06/2018.
//  Copyright © 2018 郭建峰. All rights reserved.
//

import Foundation

public extension UIImage{
    /// get image with color （获得纯色图片）
    ///
    /// - Parameters:
    ///   - color: image color
    ///   - size: image size
    /// - Returns: return image
     class func imageWithColor(color:UIColor,size:CGSize) -> UIImage{
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor);
        context.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
  
    /// get image with corner (获得圆角图片)
    ///
    /// - Parameters:
    ///   - radius: image radius
    ///   - size: image size
    /// - Returns: image
     func imageAddCorner(withRadius radius: CGFloat, andSize size: CGSize) -> UIImage! {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let ctx = UIGraphicsGetCurrentContext()
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius))
        ctx?.addPath(path.cgPath)
        ctx?.clip()
        draw(in: rect)
        ctx?.drawPath(using: .fillStroke)
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

}
