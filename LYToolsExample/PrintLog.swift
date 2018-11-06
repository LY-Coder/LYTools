//
//  PrintLog.swift
//  LYToolsExample
//
//  Created by jianyue on 2018/11/6.
//  Copyright © 2018 LYCoder. All rights reserved.
//

import Foundation


import Foundation

// 开发阶段将Other Swift Flags中的Debug值修改成-D DEBUG
// 上线后需恢复
func printLog<T>(_ message : T, file : String = #file, lineNumber : Int = #line) {
    
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):line:\(lineNumber)]- \(message)")
    
    #endif
}
