//
//  UIView+IBInspectable.swift
//  HYS3
//
//  Created by 郭建峰 on 11/05/2018.
//  Copyright © 2018 郭建峰. All rights reserved.
//

import UIKit


// MARK: - IBInspectable
public extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}

/// Extends CGRect with helper properties for positioning and setting dimensions
extension CGRect: ExpressibleByStringLiteral {
    
    /// The top coordinate of the rect.
    public var top: CGFloat {
        get {
            return origin.y
        }
        set(value) {
            origin.y = value
        }
    }
    
    // The left-side coordinate of the rect.
    public var left: CGFloat {
        get {
            return origin.x
        }
        set(value) {
            origin.x = value
        }
    }
    
    // The bottom coordinate of the rect. Setting this will change origin.y of the rect according to
    // the height of the rect.
    public var bottom: CGFloat {
        get {
            return origin.y + size.height
        }
        set(value) {
            origin.y = value - size.height
        }
    }
    
    // The right-side coordinate of the rect. Setting this will change origin.x of the rect according to
    // the width of the rect.
    public var right: CGFloat {
        get {
            return origin.x + size.width
        }
        set(value) {
            origin.x = value - size.width
        }
    }
    
    // The width of the rect.
    public var width: CGFloat {
        get {
            return size.width
        }
        set(value) {
            size.width = value
        }
    }
    
    // The height of the rect.
    public var height: CGFloat {
        get {
            return size.height
        }
        set(value) {
            size.height = value
        }
    }
    
    // The center x coordinate of the rect.
    public var centerX: CGFloat {
        get {
            return origin.x + size.width / 2
        }
        set (value) {
            origin.x = value - size.width / 2
        }
    }
    
    // The center y coordinate of the rect.
    public var centerY: CGFloat {
        get {
            return origin.y + size.height / 2
        }
        set (value) {
            origin.y = value - size.height / 2
        }
    }
    
    // The center of the rect.
    public var center: CGPoint {
        get {
            return CGPoint(x: centerX, y: centerY)
        }
        set (value) {
            centerX = value.x
            centerY = value.y
        }
    }
    
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    
    public init(stringLiteral value: StringLiteralType) {
        self.init()
        let rect: CGRect
        if value[value.startIndex] != "{" {
            let comp = value.components(separatedBy: ",")
            if comp.count == 4 {
                rect = CGRectFromString("{{\(comp[0]),\(comp[1])}, {\(comp[2]), \(comp[3])}}")
            } else {
                rect = CGRect.zero
            }
        } else {
            rect = CGRectFromString(value)
        }
        
        self.size = rect.size
        self.origin = rect.origin
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public typealias UnicodeScalarLiteralType = StringLiteralType
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: value)
    }
}

extension CGPoint: ExpressibleByStringLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    
    public init(stringLiteral value: StringLiteralType) {
        self.init()
        
        let point: CGPoint
        if value[value.startIndex] != "{" {
            point = CGPointFromString("{\(value)}")
        } else {
            point = CGPointFromString(value)
        }
        self.x = point.x
        self.y = point.y
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public typealias UnicodeScalarLiteralType = StringLiteralType
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: value)
    }
}

// MARK: - The rect of the UIView
extension UIView {
    
    /// The top coordinate of the UIView.
    public var top: CGFloat {
        get {
            return frame.top
        }
        set(value) {
            var frame = self.frame
            frame.top = value
            self.frame = frame
        }
    }
    
    /// The left coordinate of the UIView.
    public var left: CGFloat {
        get {
            return frame.left
        }
        set(value) {
            var frame = self.frame
            frame.left = value
            self.frame = frame
        }
    }
    
    /// The bottom coordinate of the UIView.
    public var bottom: CGFloat {
        get {
            return frame.bottom
        }
        set(value) {
            var frame = self.frame
            frame.bottom = value
            self.frame = frame
        }
    }
    
    /// The right coordinate of the UIView.
    public var right: CGFloat {
        get {
            return frame.right
        }
        set(value) {
            var frame = self.frame
            frame.right = value
            self.frame = frame
        }
    }
    
    // The width of the UIView.
    public var width: CGFloat {
        get {
            return frame.width
        }
        set(value) {
            var frame = self.frame
            frame.width = value
            self.frame = frame
        }
    }
    
    // The height of the UIView.
    public var height: CGFloat {
        get {
            return frame.height
        }
        set(value) {
            var frame = self.frame
            frame.height = value
            self.frame = frame
        }
    }
    
    /// The horizontal center coordinate of the UIView.
    public var centerX: CGFloat {
        get {
            return frame.centerX
        }
        set(value) {
            var frame = self.frame
            frame.centerX = value
            self.frame = frame
        }
    }
    
    /// The vertical center coordinate of the UIView.
    public var centerY: CGFloat {
        get {
            return frame.centerY
        }
        set(value) {
            var frame = self.frame
            frame.centerY = value
            self.frame = frame
        }
    }
}


public extension UIView{
    //设置文字渐变色
    func setTitleChangeGradually(_ topColor:UIColor,_ bottomColor:UIColor,bgView:UIView) {
        //定义渐变的颜色（从渐变到）
        let topColor = topColor
        let buttomColor = bottomColor
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        
        //定义每种颜色所在的位置
//        let gradientLocations:[NSNumber] = [0.0, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.frame
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //设置其CAGradientLayer对象的frame，并插入view的layer
        bgView.layer.addSublayer(gradientLayer)
        gradientLayer.mask = self.layer
        self.frame = gradientLayer.bounds
    }
    
    /// set UIView backColor changed top to bottom
    func setChangeGradually(_ topColor:UIColor,_ bottomColor:UIColor, _ gradientLocations:[NSNumber] = [0.0, 1.0]) {
        //定义渐变的颜色（从渐变到）
        let topColor = topColor
        let buttomColor = bottomColor
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = self.frame
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    ///  set UIView backColor changed left to right
    func setLRChangeGradually(_ leftColor:UIColor,_ rightColor:UIColor, _ gradientLocations:[NSNumber] = [0.0, 1.0]) {
        //定义渐变的颜色（从渐变到）
        let leftColor = leftColor
        let rightColor = rightColor
        let gradientColors = [leftColor.cgColor, rightColor.cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = self.frame
        gradientLayer.cornerRadius = self.frame.height / 2.0
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //添加虚线
    func addBottedlineWidth(_ lineWidth: CGFloat, lineColor: UIColor?) {
        let border = CAShapeLayer()
        border.strokeColor = lineColor?.cgColor
        border.fillColor = nil
        border.path = UIBezierPath(rect: bounds).cgPath
        border.frame = bounds
        border.lineWidth = lineWidth
        border.lineCap = CAShapeLayerLineCap(string: "square") as String
        //设置线宽和线间距
        border.lineDashPattern = [4, 5]
        layer.addSublayer(border)
    }
    
    
    //添加虚线
    func addVBottedlineWidth(_ lineWidth: CGFloat, lineColor: UIColor?) {
        let border = CAShapeLayer()
        border.strokeColor = lineColor?.cgColor
        border.fillColor = nil
        border.path = UIBezierPath(rect: bounds).cgPath
        border.frame = bounds
        border.lineWidth = lineWidth
        border.lineJoin = CAShapeLayerLineJoin(string: "round") as String
        //设置线宽和线间距
        border.lineDashPattern = [4, 5]
        layer.addSublayer(border)
    }

}

public extension UIView{
    func addShadow(_ rect:CGRect
        ,_ shadowOffset:CGSize  = CGSize(width: 0.0, height: 0)
        ,_ shadowOpacity: Float = 0.4)  {
        let shadowPath = UIBezierPath(rect: rect)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor;
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowPath = shadowPath.cgPath
        self.alpha = 1.0
    }
    
    func addShadow(_ color:UIColor
        ,_ rect:CGRect
        ,_ shadowOffset:CGSize  = CGSize(width: 0.0, height: 0)
        ,_ shadowOpacity: Float = 0.4
        ,_ shadowRadius:CGFloat = 5.0)  {
        self.frame = rect
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
    }

    
    func addShadowWithColor(_ color: UIColor,_ offset:CGFloat = 2.0,_ shadowRadius:CGFloat = 10.0)  {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: offset)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = shadowRadius
    }
}



public extension UIView{
    /// Responder
    func viewController()->UIViewController? {
        
        var nextResponder: UIResponder? = self
        
        repeat {
            nextResponder = nextResponder?.next
            
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            
        } while nextResponder != nil
        
        return nil
    }
    
    //UIView change to UIImage
    func screenShot() -> UIImage? {
        guard bounds.size.height > 0 && bounds.size.width > 0 else {
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, UIScreen.main.scale)
        // 之前解决不了的模糊问题就是出在这个方法上
        layer.render(in: UIGraphicsGetCurrentContext()!)
        // Renders a snapshot of the complete view hierarchy as visible onscreen into the current context.
        //        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)  // 高清截图
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

