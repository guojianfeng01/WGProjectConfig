//
//  FileManager+Hys.swift
//  HYS3
//
//  Created by 郭建峰 on 2018/10/22.
//  Copyright © 2018年 郭建峰. All rights reserved.
//

import Foundation


extension FileManager{
    
    /// 某个文件是否存在
    /// <#filePath#> 文件路径
    static func fileIsExistsAtPath(filePath:String) -> Bool{
        let manager = FileManager.default
        return manager.fileExists(atPath:filePath)
    }
}
