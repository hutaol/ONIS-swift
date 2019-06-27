//
//  UIColor+HTHelper.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    //用数值初始化颜色，便于生成设计图上标明的十六进制颜色 如valueRGB = 0x23c4f6
    convenience init(valueRGB: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((valueRGB & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((valueRGB & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(valueRGB & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    //rgbred = 0~255 同理green blue
    convenience init(rgbred:CGFloat, green:CGFloat, blue:CGFloat, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(rgbred)/255.0,
            green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255.0,
            alpha: alpha
            )
    }
}
