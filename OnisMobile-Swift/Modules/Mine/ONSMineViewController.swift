//
//  ONSMineViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/6.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ONSMineViewController: HTViewController, UITableViewDelegate, UITableViewDataSource {

    let disposeBag = DisposeBag()

    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.layer.cornerRadius = 4
        button.setTitle("注销当前用户", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = kButtonBgColor
        button.rx.tap
            .subscribe(onNext: { [weak self] in
                
                let appearance = SCLAlertView.SCLAppearance(
                    kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                    kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                    kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                    showCloseButton: false
                )
                
                let alertView = SCLAlertView(appearance: appearance)
                alertView.addButton("取消") {}
                alertView.addButton("确定") {
                    UserManager.logout()
                }
                alertView.showInfo("提示", subTitle: "是否注销当前用户")
            })
            .disposed(by: disposeBag)
        return button
    }()
    
    lazy var headerImage: UIImageView = {
        let image = UIImageView.init()
        image.setBorderRaidus(radius: 35, width: 1, color: .gray)
        image.image = UIImage.init(named: "non_photo")
        return image
    }()
    
    lazy var name: UILabel = {
        let label = UILabel.init()
        label.text = currentUser.username
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var desc: UILabel = {
        let label = UILabel.init()
        label.text = "未说明"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var datas: Array = { () -> [String] in
        let arr = [
            "服务器地址",
            "关于我们",
        ]
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 90))
        self.tableView.tableFooterView = footerView
        footerView.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.right.equalToSuperview().offset(-20)
        }
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 100))
        headerView.backgroundColor = .white
        self.tableView.tableHeaderView = headerView
        headerView.addSubview(headerImage)
        headerImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.height.width.equalTo(70)
        }
        
        headerView.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.left.equalTo(headerImage.snp_right).offset(20)
            make.centerY.equalToSuperview().offset(-12)
        }
        
        headerView.addSubview(desc)
        desc.snp.makeConstraints { (make) in
            make.left.equalTo(headerImage.snp_right).offset(20)
            make.centerY.equalToSuperview().offset(12)
        }
        
    }
}

extension ONSMineViewController {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 20))
        return view
    }
    
}
