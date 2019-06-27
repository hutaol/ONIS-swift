//
//  ExtensionMethod.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/6.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import Foundation


/// 创建数据库的名字
///
/// - db: db
public enum dataBaseName: String {
    case db = "db"
}

/// 在run debug的状态打印所需要的信息
///
/// - Parameter items: 所要打印的内容
public func mPrint(_ items: Any...) {
    #if DEBUG
    debugPrint(items)
    #endif
}
