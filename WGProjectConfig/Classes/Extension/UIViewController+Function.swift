//
//  UIViewController+Function.swift
//  Hys
//
//  Created by Lic on 2017/9/13.
//  Copyright © 2017年 VZEN. All rights reserved.
//

import UIKit

extension UIViewController {
//
//    //MARK:- 添加nav右边文字按钮
//    @discardableResult
//    func setRightTitle(_ title : String) -> ControlEvent<Void>? {
//        if (title.length == 0) {
//            navigationItem.rightBarButtonItem = nil
//            return nil
//        }
//        else {
//            let item = UIBarButtonItem(title: title, style: .done, target: nil, action: nil)
//            navigationItem.setRightBarButton(item, animated: false)
//            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.textThemeColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], for: .normal)
//            return item.rx.tap
//        }
//    }
//
////
////    // MARK: - Method Swizzling
////
////    func nsh_viewWillAppear(animated: Bool) {
////        self.nsh_viewWillAppear(animated: animated)
////
////        print("\n\nnsh_viewWillAppear: \(description)\n\n")
////    }
////
}

//public extension Reactive where Base: UIViewController {
//
//    var viewWillAppear: ControlEvent<Bool> {
//        let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
//        return ControlEvent(events: source)
//    }
//}
