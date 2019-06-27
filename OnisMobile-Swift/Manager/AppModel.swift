//
//  AppModel.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/10.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import RealmSwift


class App: Object {
    @objc dynamic var serverAddress: String?
    @objc dynamic var serverVersion: String?
}
