//
//  Util.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/10.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import Foundation
import UIKit

class Util: NSObject {
    
    class func sectionArrayForWork(dataArray: [ONSWorkModel]) -> Array<Any> {
        
        var list = Array<Any>()
        
        //可变集合
        let operationSet = NSMutableSet()
        //遍历数组加进集合
        for obj in dataArray {
            operationSet.add(obj.sfnnodename ?? "unknow")
        }

        let sortDesc = NSSortDescriptor.init(key: nil, ascending: false)
        let sortSetArray = operationSet.sortedArray(using: [sortDesc]) as Array
        
        //遍历集合
        for item in sortSetArray {
            //根据数组里面的 sfnnodename 属性进行分组，相同的返回过滤数组
            let filterArray = dataArray.filter {
                let str = item as! String
                return $0.sfnnodename == str
                
            }
            //将数组添加到数据源数组
            let title = "\(item) 共\(filterArray.count)项"
            let dic: Dictionary = ["list": filterArray, "title": title] as [String : Any]
            list.append(dic)
        }
        
        return list;
        
    }
}


