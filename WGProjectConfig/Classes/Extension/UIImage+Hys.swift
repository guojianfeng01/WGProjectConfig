//
//  UIImage+Hys.swift
//  HYS3
//
//  Created by 郭建峰 on 11/06/2018.
//  Copyright © 2018 郭建峰. All rights reserved.
//

import Foundation

extension UIImage{
    class func imageWithColor(color:UIColor,size:CGSize) -> UIImage
    {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor);
        context.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
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
