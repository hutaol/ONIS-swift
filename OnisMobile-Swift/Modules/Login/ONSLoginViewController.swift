//
//  ONSLoginViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON


class ONSLoginViewController: UIViewController {

    lazy var contentView: UIView = {
        let view = UIView.init()
        view.setBorderRaidus(radius: 10)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.text = "移动ONIS"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var setupButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setImage(UIImage.init(named: "setup_login"), for: .normal)
        button.addTarget(self, action: #selector(onClickSetup), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("登录", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = kButtonBgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(onClickLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var rememberPwdBtn: HTChoiceButton = {
        let button = HTChoiceButton.init(frame: CGRect.init(x: 20, y: 180, width: 100, height: 30))
        button.titleName = "记住密码"
        button.imageName = "login_select"
        return button
    }()
    
    lazy var autoLoginBtn: HTChoiceButton = {
        let button = HTChoiceButton.init()
        button.titleName = "自动登录"
        button.imageName = "login_select"
        return button
    }()
    
    lazy var centerView: UIView = {
        let view = UIView.init()
        view.setBorderRaidus(radius: 5, width: 1, color: .gray)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var name: ONSLoginTextField = {
        let textField = ONSLoginTextField.init()
        textField.placeholder = "请输入用户名"
        textField.leftImage = "login_user"
        
        let button = UIButton.init(type: .system)
        button.setImage(UIImage.init(named: "arrow_down"), for: .normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        button.imageView?.contentMode = .center
        button.addTarget(self, action: #selector(onClickNameMore), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
        
        return textField
    }()
    
    lazy var password: ONSLoginTextField = {
        let textField = ONSLoginTextField.init()
        textField.placeholder = "请输入密码"
        textField.leftImage = "login_pwd"
        return textField
    }()
    
    lazy var lineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = kButtonBgColor
        self.view.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(setupButton)
        contentView.addSubview(loginButton)
        contentView.addSubview(rememberPwdBtn)
        contentView.addSubview(autoLoginBtn)
        contentView.addSubview(centerView)
        centerView.addSubview(name)
        centerView.addSubview(password)
        centerView.addSubview(lineView)
        
        let ww = self.view.width > self.view.height ? self.view.width : self.view.height
        contentView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view).offset(-40)
            make.centerX.equalToSuperview()
            make.width.equalTo(ww/5*2)
            make.height.equalTo(ww/5*2/5*4)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(20)
        }
        setupButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel);
            make.right.equalTo(-20);
        }
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo((-20))
            make.bottom.equalTo((-20))
            make.height.equalTo(50)
        }
        rememberPwdBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.left.equalTo(20)
            make.bottom.equalTo(loginButton.snp_top).offset(-20)
        }
        autoLoginBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.right.equalTo(-20);
            make.bottom.equalTo(loginButton.snp_top).offset(-20)
        }
        
        centerView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20);
            make.top.equalTo(setupButton.snp_bottom).offset(20)
            make.bottom.equalTo(rememberPwdBtn.snp_top).offset(-20)
        }
        name.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(centerView)
            make.height.equalToSuperview().dividedBy(2)
        }
        password.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
            make.centerY.equalToSuperview()
        }
        
    }
    
    @objc func onClickLogin() {
        
        UserManager.userLogin(account: "D0029", pwd: "erc", isAuto: false)
        
    }
    
    @objc func onClickSetup() {
        
    }
    
    @objc func onClickNameMore() {

    }

}
