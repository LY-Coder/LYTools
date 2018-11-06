//
//  LYCache.swift
//  LYToolsExample
//
//  Created by jianyue on 2018/11/6.
//  Copyright © 2018 LYCoder. All rights reserved.
//

import UIKit

class LYCache: NSObject {
    
    /// 单例对象
    static let shared = LYCache()
    
    override init() { super.init() }
    
    // 文件管理对象
    fileprivate var fileManager: FileManager {
        return FileManager.default
    }
    
    /// 读取缓存大小
    var size: String {
        return String(format: "%.2fM", LYCache.shared.forderSizeAtPath(path: cachesPath))
    }
    
    /// 清除缓存 自己决定清除缓存的位置
    func clean(competion:() -> ()) {
        LYCache.shared.deleteFolder(path: cachesPath)
        competion()
    }
    
    /// 删除文件夹下的所有文件
    func deleteFolder(path: String) {
        if !fileManager.fileExists(atPath: path) {
            // 文件夹中没有文件
        }
        let subpaths = fileManager.subpaths(atPath: path)
        for subpath in subpaths! {
            let fileAbsoluePath = path+"/"+subpath
            LYCache.shared.deleteFile(path: fileAbsoluePath)
        }
    }
    
    /// 删除单个文件
    func deleteFile(path: String) {
        do {
            try fileManager.removeItem(atPath: path)
        } catch {
            dump(error)
        }
    }
    
    /// 遍历所有子目录， 并计算文件大小
    func forderSizeAtPath(path: String) -> Double {
        if !fileManager.fileExists(atPath: path) {
            // 路径下没有文件
            return 0.0
        }
        var fileSize: Double = 0
        let subpaths = fileManager.subpaths(atPath: path)
        for subpath in subpaths! {
            let fileAbsoluePath = path+"/"+subpath
            fileSize += LYCache.shared.fileSize(path: fileAbsoluePath)
        }
        return fileSize
    }
    
    /// 计算单个文件的大小
    func fileSize(path: String) -> Double {
        var fileSize: Double = 0.0
        do {
            let attr = try fileManager.attributesOfItem(atPath: path)
            fileSize = Double(attr[FileAttributeKey.size] as! UInt)
        } catch {
            dump(error)
        }
        return fileSize/1024/1024
    }
}

extension LYCache {
    /// 缓存路径
    fileprivate var cachesPath: String {
        return NSHomeDirectory().appending("/Library/Caches/")
    }
}
