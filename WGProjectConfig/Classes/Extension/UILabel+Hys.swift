//
//  UILabel+Hys.swift
//  HYS3
//
//  Created by 郭建峰 on 31/05/2018.
//  Copyright © 2018 郭建峰. All rights reserved.
//

import Foundation

public extension UILabel{

    /// Init different fonts, same colors
    ///
    /// - Parameters:
    ///   - mainFont: The main font
    ///   - range: The text range will be set
    ///   - titleFont: Text fonts to be set
    ///   - color: Text color to be set
    ///   - lineSpace: Line spacing
    convenience init(title: String, mainFont: UIFont, color: UIColor, range: NSRange, font titleFont: UIFont){
        self.init(title: title, mainFont: mainFont, mainColor: color, range: range, font: titleFont, color: color)
    }
    
    /// Init same fonts, different colors
    ///
    /// - Parameters:
    ///   - mainFont: The main font
    ///   - mainColor: The main color
    ///   - range: The text range will be set
    ///   - color: Text color to be set
    ///   - lineSpace: Line spacing
    convenience init(title: String, mainFont: UIFont, mainColor: UIColor, range: NSRange, color: UIColor){
        self.init(title: title, mainFont: mainFont, mainColor: mainColor, range: range, font: mainFont, color: color)
    }
    
    /// init Different fonts, different colors
    ///
    /// - Parameters:
    ///   - mainFont: The main font
    ///   - mainColor: The main color
    ///   - range: The text range will be set
    ///   - titleFont: Text fonts to be set
    ///   - color: Text color to be set
    ///   - lineSpace: Line spacing
    convenience init(title: String, mainFont: UIFont, mainColor: UIColor, range: NSRange, font titleFont: UIFont, color: UIColor) {
        self.init()
        self.font = mainFont
        self.textColor = mainColor
        //设置特定string
        let str = NSMutableAttributedString(string: title)
        str.addAttributes([NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: color], range: range)
        //赋给label
        self.attributedText = str
    }
    
    /// Different fonts, same colors
    ///
    /// - Parameters:
    ///   - mainFont: The main font
    ///   - range: The text range will be set
    ///   - titleFont: Text fonts to be set
    ///   - color: Text color to be set
    ///   - lineSpace: Line spacing
    func label(withMainFont mainFont: UIFont, color: UIColor, range: NSRange, font titleFont: UIFont, lineSpace: CGFloat = 0) {
        self.label(withMainFont: mainFont, mainColor: color, range: range, font: titleFont, color: color, lineSpace: lineSpace)
    }
    
    
    /// Same fonts, different colors
    ///
    /// - Parameters:
    ///   - mainFont: The main font
    ///   - mainColor: The main color
    ///   - range: The text range will be set
    ///   - color: Text color to be set
    ///   - lineSpace: Line spacing
    func label(withFont font: UIFont, mainColor: UIColor, range: NSRange, color: UIColor, lineSpace: CGFloat) {
        self.label(withMainFont: font, mainColor: color, range: range, font: font, color: color, lineSpace: lineSpace)
    }
    
    
    /// Different fonts, different colors
    ///
    /// - Parameters:
    ///   - mainFont: The main font
    ///   - mainColor: The main color
    ///   - range: The text range will be set
    ///   - titleFont: Text fonts to be set
    ///   - color: Text color to be set
    ///   - lineSpace: Line spacing
    func label(withMainFont mainFont: UIFont, mainColor: UIColor, range: NSRange, font titleFont: UIFont, color: UIColor, lineSpace: CGFloat) {
        font = mainFont
        textColor = mainColor
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        let str = NSMutableAttributedString(string: text!)
        str.addAttributes([NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.paragraphStyle: paragraphStyle], range: range)
        attributedText = str
    }
    
    /// Set line text and spacing
    ///
    /// - Parameters:
    ///   - text: string
    ///   - lineSpacing: space
    func setText(_ text: String, lineSpacing: CGFloat) {
        if lineSpacing < 0.01 || text.isEmpty {
            self.text = text
            return
        }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: text.length))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAlignment
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: text.length))
        attributedText = attributedString
    }
    
    
    /// Set line spacing
    ///
    /// - Parameter lineSpacing: lineSpacing
    func setText(lineSpacing: CGFloat) {
        guard let text = self.text else {
            return
        }
        self.setText(text, lineSpacing: lineSpacing)
    }
    
    
    /// Label underline
    ///
    /// - Parameters:
    ///   - title: title
    ///   - font: font
    ///   - color: color
    ///   - textAlignment: textAlignment
    /// - Returns: UILabel
    static func createLineLabel(withTitle title: String, titleFont font: UIFont, titleColor color: UIColor?, textAlignment: NSTextAlignment) -> UILabel? {
        let la = UILabel()
        let attribtDic = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let attribtStr = NSMutableAttributedString(string: title, attributes: attribtDic)
        la.attributedText = attribtStr
        la.textAlignment = textAlignment
        la.textColor = color
        la.font = font
        return la
    }
    
    //设置文字阴影
    func label(withMainFont mainFont: UIFont, mainColor: UIColor, range: NSRange, font titleFont: UIFont, color: UIColor, lineSpace: CGFloat,shadowColor:UIColor) {
        font = mainFont
        textColor = mainColor
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        //调整行间距
        //设置特定string
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 1.0
        shadow.shadowColor = shadowColor
        shadow.shadowOffset = CGSize(width: 0.0, height: 1.0)
        let str = NSMutableAttributedString(string: text!)
        str.addAttributes([NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.paragraphStyle: paragraphStyle,NSAttributedString.Key.shadow:shadow], range: range)
        //赋给label
        attributedText = str
    }

    //设置html标签
    func setHtmlText(_ text: String, lineSpacing: CGFloat,_ isOneLine:Bool = false) {
        if text.xnStringAllIsEmpty() {
            self.text = ""
            return
        }
        
        let attributedString = try! NSMutableAttributedString(data: text.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attributedString.length))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = isOneLine ? 0 : lineSpacing
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAlignment
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        attributedText = attributedString
    }
    
    /// 改变行间距
    func changeLineSpace(space: Float) {
        guard let labelText = self.text else {
            return
        }
        let attributedString = NSMutableAttributedString(string: labelText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(space)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: labelText.length))
        self.attributedText = attributedString
        self.sizeToFit()
    }
    
    /// 改变字间距
    func changeWordSpace(space: Float) {
        guard let labelText = self.text else {
            return
        }
        let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: space])
        let paragraphStyle = NSMutableParagraphStyle()
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: labelText.count))
        self.attributedText = attributedString
        self.sizeToFit()
    }
    
    /// 改变行间距和字间距
    func changeSpace(lineSpace: Float, wordSpace: Float) {
        guard let labelText = self.text else {
            return
        }
        let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.kern: wordSpace])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineSpace)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: labelText.count))
        self.attributedText = attributedString
        self.sizeToFit()
    }
    
}

