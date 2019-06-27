//
//  UIView+HTHelper.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/10.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // left
    public var left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    // top
    public var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    // width
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    // height
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    // right
    public var maxX:CGFloat{
        get {
            return self.left + self.width
        }
    }
    
    // bottom
    public var bottom:CGFloat {
        get {
            return self.top + self.height
        }
    }
    
    // centerX
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    // centerY
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
    
    
    // 删除所有的子视图
    func removeAllSubView() -> Void {
        for view : UIView in self.subviews{
            view.removeFromSuperview();
        }
    }
    
    // 加载XIB文件
    public class func initWithXibName(xib:String) -> Any? {
        guard let nibs:Array = Bundle.main.loadNibNamed(xib, owner: nil, options: nil)else{
            return nil;
        }
        return nibs[0] ;
    }
    
    // 设置边框
    func setBorderWithColor(color:UIColor, top:Bool, right:Bool, bottom:Bool, left:Bool, width:CGFloat) -> Void {
        if top == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: 0, width: self.width, height: width);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if right == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: self.width - width, y: 0, width: width, height: self.height);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if bottom == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: self.height - width, width: self.width, height: width);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
        if left == true {
            let layer:CALayer = CALayer();
            layer.frame = CGRect(x: 0, y: 0, width: width, height: self.height);
            layer.backgroundColor = color.cgColor;
            self.layer.addSublayer(layer);
        }
    }
    
    // 设置圆角
    func setBorderRaidus(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func setBorderRaidus(radius: CGFloat, width: CGFloat, color: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }
}

