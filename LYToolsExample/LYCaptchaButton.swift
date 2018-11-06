//
//  LYCaptchaButton.swift
//  LYToolsExample
//
//  Created by jianyue on 2018/11/6.
//  Copyright © 2018 LYCoder. All rights reserved.
//

import UIKit

class LYCaptchaButton: UIButton {
    
    // 倒计时总秒数  默认60
    @IBInspectable open var seconds: UInt = 10
    
    func send <T: NSObject>(in inputObjc: T, click: (_ outputObjc: T?, _ button: LYCaptchaButton) -> ()) {
        
        send()
        weak var outputObjc = inputObjc
        click(outputObjc, self)
    }

    // 发送验证码
    open func send() {
        // 1.赋值剩余时间
        residue_seconds = seconds
        
        // 2.开启定时器
        startTimer()
    }
    
    // 使无效
    open func invalidate() {
        timer.invalidate()
    }
    
    lazy var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
        self.updateUI()
    })
    
    deinit {
        print("LYCaptchaButton-deinit")
    }
}

extension LYCaptchaButton {
    fileprivate func startTimer() {
        timer.fireDate = Date.distantPast
        isEnabled = false
    }
    
    fileprivate func stopTimer() {
        timer.fireDate = Date.distantFuture
        isEnabled = true
    }
    
    fileprivate func updateUI() {
        if residue_seconds == 0 {
            stopTimer()
            setTitle("再次发送", for: .normal)
            return
        }
        residue_seconds = residue_seconds - 1
        setTitle("再次发送（\(residue_seconds)）", for: .normal)
    }
}

extension LYCaptchaButton {
    struct AssociatedKeys {
        static var residue_seconds: UInt = 0
    }
    
    var residue_seconds: UInt {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.residue_seconds, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.residue_seconds) as? UInt else { return 0 }
            return value
        }
    }
}
