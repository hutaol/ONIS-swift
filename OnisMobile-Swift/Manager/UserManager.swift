//
//  UserManager.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/5.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

// 当前用户 User
var currentUser: User = User()


class UserManager: NSObject {

    class func userLogin(account: String, pwd: String, isAuto: Bool) {
        
        Network.request(.login(account: account, password: pwd), success: { (json) in
            
            let success = json["success"].boolValue
            if success {
                
                let userId = json["userid"].stringValue
                Network.request(.userInfo(userId: userId), success: { (json) in
                    let success = json["success"].boolValue

                    if success {
                        let data = json["data"]
                        let user = User()
                        user.account = data["account"].stringValue
                        user.deptid = data["deptid"].stringValue
                        user.locked = data["locked"].intValue
                        user.remark = data["remark"].stringValue
                        user.sex = data["sex"].intValue
                        user.simplename = data["simplename"].stringValue
                        user.userid = data["userid"].intValue
                        user.username = data["username"].stringValue
                        user.usertype = data["usertype"].intValue
                        user.password = pwd
                        Rx_RealmUtility.addObject(user, update: true).subscribe().dispose()
                        currentUser = user
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoginStateChange"), object: true)

                    } else {
                        SCLAlertView().showTitle("登录失败", style: .error)

                    }

                }, error: { (code) in
                    
                }, failure: { (error) in
                    
                })

            } else {
                SCLAlertView().showTitle(json["msg"].stringValue, style: .error)
            }
            
        }, error: { (statusCode) in
            
            print("请求错误！错误码：\(statusCode)")

            
        }) { (error) in
            print("请求失败！错误信息：\(error.errorDescription ?? "")")

        }
    }
    
    class func autoUserLogin() {
        userLogin(account: "D0029", pwd: "erc", isAuto: true)
    }
    
    class func logout() {
        // TODO 退出登录 返回的是 html
        Network.request(.logout("10000004", "erc"), success: { (json) in
            mPrint("json：\(json)")
        }, error: { (statusCode) in
            mPrint("请求错误！错误码：\(statusCode)")
        }) { (error) in
            mPrint("请求失败！错误信息：\(error.errorDescription ?? "")")
        }
        Rx_RealmUtility.deleteObject(currentUser).subscribe().dispose()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoginStateChange"), object: false)
    }
    
    class func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }
    
    
}
