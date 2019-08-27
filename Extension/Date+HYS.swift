//
//  Date+HYS.swift
//  HYS3
//
//  Created by 郭建峰 on 2018/10/30.
//  Copyright © 2018 郭建峰. All rights reserved.
//

import Foundation


public extension Date{
    
    ///获得当前年份字符串,get current year string
    func currentYear() -> String{
        let currentDate = Date()
        let calender = Calendar.current
        let component = calender.component(Calendar.Component.year, from: currentDate)
        return "\(component)"
    }
    
    ///获得当前月份字符串,get current Month string
    func currentMonth() -> String{
        let currentDate = Date()
        let calender = Calendar.current
        let component = calender.component(Calendar.Component.month, from: currentDate)
        return "\(component)"
    }
    
    /// <#endTime#> distance now to future, 到未来某个时间的时间差
    func deltaFrom(endTime: Int) -> String {
        if TimeInterval(endTime) > Date().timeIntervalSince1970{
            let timeNumber =  TimeInterval(endTime) - Date().timeIntervalSince1970
            return getHHMMSSFormSS(seconds: Int(timeNumber))
        }else{
            return "00:00:00"
        }
    }
    
    func getHHMMSSFormSS(seconds:Int) -> String {
        let str_hour = NSString(format: "%02ld", seconds/3600)
        let str_minute = NSString(format: "%02ld", (seconds%3600)/60)
        let str_second = NSString(format: "%02ld", seconds%60)
        let format_time = NSString(format: "%@:%@:%@",str_hour,str_minute,str_second)
        return format_time as String
    }
}
