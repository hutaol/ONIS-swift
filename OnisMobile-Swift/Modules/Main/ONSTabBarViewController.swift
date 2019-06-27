//
//  ONSTabBarViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class ONSTabBarViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let message = ONSMessageViewController()

        let work = ONSWorkSplitViewController()
        let treatment = ONSMessageViewController()
        let medical = UIViewController()
        let patient = UIViewController()
        let image = UIViewController()
        let setup = UIViewController()
        let mine = ONSMineViewController()

        let radiation = UIViewController()

        
        message.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "我的消息", image: UIImage.init(named: "icon_message"), selectedImage: UIImage.init(named: "icon_message_selected"))
        work.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "我的工作", image: UIImage.init(named: "icon_work"), selectedImage: UIImage.init(named: "icon_work_selected"))
        treatment.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "治疗安排", image: UIImage.init(named: "icon_treatment"), selectedImage: UIImage.init(named: "icon_treatment_selected"))
        medical.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "病历管理", image: nil, selectedImage: nil)
        patient.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "主管病人", image: nil, selectedImage: nil)
        image.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "靶区勾画", image: nil, selectedImage: nil)
        radiation.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "放疗计划", image: nil, selectedImage: nil)

        setup.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "设置", image: nil, selectedImage: nil)
        mine.tabBarItem = ESTabBarItem.init(ESTabBarItemContentView(), title: "我的", image: nil, selectedImage: nil)

        
        let messageNav = ONSNavigationController.init(rootViewController: message)
        
//        let workNav = ONSNavigationController.init(rootViewController: work)
        let treatmentNav = ONSNavigationController.init(rootViewController: treatment)
        let medicalNav = ONSNavigationController.init(rootViewController: medical)
        let patientNav = ONSNavigationController.init(rootViewController: patient)
        
        let imageNav = ONSNavigationController.init(rootViewController: image)
        let radiationNav = ONSNavigationController.init(rootViewController: radiation)

        let setupNav = ONSNavigationController.init(rootViewController: setup)
        let mineNav = ONSNavigationController.init(rootViewController: mine)

        message.title = "我的消息"
        work.title = "我的工作"
        treatment.title = "治疗安排"
        medical.title = "病历管理"
        patient.title = "主管病人"
        image.title = "靶区勾画"
        radiation.title = "放疗计划"

        setup.title = "设置"
        mine.title = "我的"
        
        self.viewControllers = [messageNav, work, treatmentNav, medicalNav, patientNav, imageNav, radiationNav, mineNav]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
