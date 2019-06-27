//
//  Request.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/6.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import SwiftyJSON

class Request: NSObject {
    
    class func getUserInfo(userId: String,
        success successCallback: @escaping (JSON) -> Void
        ) {
        
        Network.request(.userInfo(userId: userId), success: { (json) in
            successCallback(json)

        }, error: { (code) in
            
        }) { (error) in
            
        }
        
    }

}
