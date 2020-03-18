//
//  ViewController.swift
//  WGProjectConfig
//
//  Created by guojianfeng01 on 08/27/2019.
//  Copyright (c) 2019 guojianfeng01. All rights reserved.
//

import UIKit
import WGProjectConfig

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        testButton.backgroundColor = UIColor.red
        view.addSubview(testButton)
        testButton.addTarget(self, action: #selector(textButtonAction), for: UIControl.Event.touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func textButtonAction(){
        let vc = WDGTestController()
        self.present(vc, animated: true, completion: nil)
    }
}

