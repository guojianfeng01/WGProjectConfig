//
//  String+Common.swift
//  Hys
//
//  Created by Lic on 2017/9/5.
//  Copyright © 2017年 VZEN. All rights reserved.
//

import UIKit
import CommonCrypto

public extension String {
    var shape: CGSize{
        get {
            return CGSize.zero
        }
    }
    
    ///字符串长度
    var length: Int {
        return self.count
    }
    
    ///字符串转 float
    var floatValue: CGFloat {
        var cgFloat: CGFloat = 0
        if let doubleValue = Double(self)
        {
            cgFloat = CGFloat(doubleValue)
        }
        return cgFloat
    }
    
 
    
    var url: URL? {
        if self.hasPrefix("http") {
            return URL(string: self)
        }
        else {
            let string = "http://\(self)"
            return URL(string: string)
        }
    }
//    字符串转MD5
    var md5: String {
        let cStr = cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
//     随机字符串， length 生成随机字符串的长度
    static func random(length: Int) -> String {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var c = charSet.map { String($0) }
        var s:String = ""
        for _ in (1...length) {
            let intC =  UInt64(arc4random()) % UInt64(c.count)
            s.append(c[ Int(intC)])
        }
        if s.isEmpty{
            s = "haoyishu67"
        }
        return s
    }
//    字符串sha1
    var sha1: String {
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}

public extension String{
    /// 获取文字的size
    ///
    /// - Parameter font: font
    /// - Returns: CGSize
    func size(_ font: CGFloat) -> CGSize {
        let str = self as NSString
        return str.size(withAttributes: [NSAttributedString.Key.font : font])
    }
    
    
    /// 是否为空格，或者为空
    ///
    /// - Returns: Bool
    func xnStringAllIsEmpty() -> Bool {
        if self.isEmpty{
            return true
        }
        let set = NSCharacterSet.whitespacesAndNewlines
        let trimedString = self.trimmingCharacters(in: set)
        if trimedString.count == 0 {
            return true;
        }else {
            return false;
        }
    }
    
    /// q去掉html标签
    ///
    /// - Returns: 不含html标签的string
    func getNoHoveHtmlString() -> String{
        if self.isEmpty {
            return ""
        }
        let attributedString = try! NSMutableAttributedString(data: self.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        return attributedString.string
    }
    
    //使用正则表达式替换
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],range: NSMakeRange(0,self.count),withTemplate: with)
    }
    
    //正则表达式替换字符串中html标签
    func htmlPregReplace() -> String{
        return self.pregReplace(pattern: "<[^>]*>", with: "")
    }

    /// 获得文字高度
    static func getTextHeigh(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let normalText = textStr as NSString
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        return stringSize.height
    }
    
    /// 获得文字行数
    static func getTextRow(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let desHeight = getTextHeigh(textStr: textStr, font: font, width: width)
        let oneHeight =  getTextHeigh(textStr: "你好", font: font, width: width)
        let row = desHeight / oneHeight
        return row
    }
    
    /// 获得文字宽度
    static func getTextWidth(textStr:String,font:UIFont) -> CGFloat {
        let normalText = textStr as NSString
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        return stringSize.width
    }
    
    //获取时分秒
    static func formatSecondsToString(_ secounds: TimeInterval) -> String {
        if secounds.isNaN {
            return "00:00"
        }
        let Min = Int(secounds / 60)
        let Sec = Int(secounds.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", Min, Sec)
    }
}

