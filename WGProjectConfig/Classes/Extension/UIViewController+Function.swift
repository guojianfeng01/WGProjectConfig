//
//  UIViewController+Function.swift
//  Hys
//
//  Created by Lic on 2017/9/13.
//  Copyright © 2017年 VZEN. All rights reserved.
//

import UIKit

extension UIViewController {
    
  public  static func initializeMethod(){
        let originalSelector = #selector(UIViewController.viewWillAppear(_:))
        let swizzledSelector = #selector(UIViewController.nsh_viewWillAppear(animated:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        let didAddMethod: Bool = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        }else{
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }

    // MARK: - Method Swizzling
    @objc func nsh_viewWillAppear(animated: Bool) {
        self.nsh_viewWillAppear(animated: animated)

        print("\n\nnsh_viewWillAppear: \(description)\n\n")
    }

}

//public extension Reactive where Base: UIViewController {
//
//    var viewWillAppear: ControlEvent<Bool> {
//        let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
//        return ControlEvent(events: source)
//    }
//}
