//
//  ONSNavigationController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

class ONSNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarAppearence()

    }
    
    func setupNavBarAppearence() {
        // 设置导航栏默认的背景颜色
        WRNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        
        // 设置导航栏所有按钮的
        WRNavigationBar.defaultNavBarTintColor = UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
        WRNavigationBar.defaultNavBarTitleColor = UIColor.black
        // 统一设置导航栏样式
        //        WRNavigationBar.defaultStatusBarStyle = .lightContent
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        WRNavigationBar.defaultShadowImageHidden = true
        
    }

}

extension ONSNavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
