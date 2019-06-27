//
//  ONSWorkViewModel.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON


class ONSWorkViewModel: NSObject {
    
    // MARK - 数据模型
    var taskDoingList = Array<Dictionary<String, Any>>()
    
    // Mark: -数据源更新
    typealias AddDataBlock = () -> Void
    var updateDataBlock:AddDataBlock?
}

extension ONSWorkViewModel {
    
    func refreshDataSource() {
        
        Network.request(.doingWork(start: 0, limit: 0, type: "0", searchstr: "", flowname: ""), success: { (json) in
//            let totalCount = json["TOTALCOUNT"]
            
            if let taskDoingList = JSONDeserializer<ONSWorkModel>.deserializeModelArrayFrom(json: json["ROOT"].description) {
//                self.taskDoingList = (taskDoingList as? [ONSWorkModel])!
                
                self.taskDoingList = Util.sectionArrayForWork(dataArray: taskDoingList as! [ONSWorkModel]) as! [Dictionary<String, Any>]
            }
            
            self.updateDataBlock?()
            
        }, error: { (code) in
            
        }) { (error) in
            
        }
        
       
    }
    
}

extension ONSWorkViewModel {
    func numberOfSections(collectionView:UICollectionView) ->Int {
        return 1
    }
    
    func numberOfRowsInSection(section: NSInteger) -> NSInteger {
        return self.taskDoingList.count
    }

}
