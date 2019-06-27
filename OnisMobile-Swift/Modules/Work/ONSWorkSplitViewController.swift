//
//  ONSWorkSplitViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

class ONSWorkSplitViewController: UISplitViewController, UISplitViewControllerDelegate {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let work = ONSWorkViewController()
        let workDetail = ONSWorkDetailViewController()
        
        let workNav = ONSNavigationController.init(rootViewController: work)
        
        let workDetailNav = ONSNavigationController.init(rootViewController: workDetail)
//        workDetail.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(onClickBack))
        work.selectBlock = { (list, title) in
            workDetail.updateData(list)
            workDetail.title = title as String
        }
        
        self.viewControllers = [workNav, workDetailNav]
        
        self.delegate = self;

        self.maximumPrimaryColumnWidth = 230
        self.preferredDisplayMode = .allVisible
    }
    
    @objc func onClickBack(barItem: UIBarButtonItem) {
//        self.show(work, sender: barItem)
    }
    
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewController.DisplayMode) {
        
    }
    
  
    

}
