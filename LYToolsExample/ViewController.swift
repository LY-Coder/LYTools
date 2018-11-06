//
//  ViewController.swift
//  LYToolsExample
//
//  Created by jianyue on 2018/11/6.
//  Copyright © 2018 LYCoder. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let btn = LYCaptchaButton(type: .custom)
//        btn.send(in: self) { (weakSelf, status) in
//
//        }
        
        
        btn.send()
    }


}

