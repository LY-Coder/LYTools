//
//  CaptchaViewController.swift
//  LYToolsExample
//
//  Created by jianyue on 2018/11/6.
//  Copyright © 2018 LYCoder. All rights reserved.
//

import UIKit

class CaptchaViewController: UIViewController {

    @IBOutlet weak var captchaBtn: LYCaptchaButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func captchaBtnAction(_ sender: LYCaptchaButton) {
        
        captchaBtn.send()
        
    }
    
    deinit {
        captchaBtn.invalidate()
    }

}
