//
//  AppManager.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/6.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import SwiftyJSON


var serverAddress = "http://172.22.1.13:8080"
var serverVersion = "1"

class AppManager: NSObject {
    
    class func getServer() {
        
    }
    
    class func config() {

        Rx_RealmUtility.getObjects(type: App.self).subscribe(onNext: { (results) in
            
            mPrint("app config :", results as Any)
            if results!.count > 0 {
                let app = results?[0] as! App
                serverAddress = app.serverAddress!
                serverVersion = app.serverVersion!
            } else {
                let app = App(value: ["serverAddress": "http://172.22.1.13:8080", "serverVersion": "1"])
                serverAddress = app.serverAddress!
                serverVersion = app.serverVersion!
                Rx_RealmUtility.addObject(app).subscribe().dispose()
            }
            
        }).dispose()

    }
}


