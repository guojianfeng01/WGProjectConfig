//
//  UIScreen+Hys.swift
//  HYS3
//
//  Created by 郭建峰 on 2018/10/10.
//  Copyright © 2018年 郭建峰. All rights reserved.
//

import Foundation

extension UIScreen{
    //Screen resolution(width / height)
    var resolution: String{
        let rectScreen = UIScreen.main.bounds
        let sizeScreen = rectScreen.size
        let scale = UIScreen.main.scale
        let width = sizeScreen.width * scale
        let height = sizeScreen.height * scale
        return "\(width)*\(height)"
    }
}
