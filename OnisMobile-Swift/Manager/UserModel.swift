//
//  UserModel.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/6.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    @objc dynamic var sex: Int = 0
    @objc dynamic var username: String?
    @objc dynamic var deptid: String?
    @objc dynamic var remark: String?
    @objc dynamic var simplename: String?
    @objc dynamic var userid: Int = 0
    @objc dynamic var account: String?
    @objc dynamic var usertype: Int = 0
    @objc dynamic var locked: Int = 0
    @objc dynamic var password: String?
    
    override static func primaryKey() -> String? {
        return "userid"
    }
    
}

