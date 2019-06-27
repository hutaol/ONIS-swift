//
//  ONSWorkViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit
import SwiftyJSON

class ONSWorkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var viewModel: ONSWorkViewModel = {
        return ONSWorkViewModel()
    }()
    
    lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl.init(items: ["待办工作", "已办工作"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(onClickSegement), for: .touchUpInside)
        return segment
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return tableView
    }()
    
    typealias SelectBlock = (_ list: [ONSWorkModel], _ title: NSString) -> Void
    var selectBlock:SelectBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "工作"

        setupData()
        setupView()
    }
    
    func setupView() {
        self.navigationItem.titleView = segment
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupData() {
        
        viewModel.updateDataBlock = { [unowned self] in
            self.tableView.reloadData()
            self.selectIndex(0)
        }
        viewModel.refreshDataSource()
    }
    
    @objc func onClickSegement() {
        
    }

}

extension ONSWorkViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")

        let data = viewModel.taskDoingList[indexPath.row]
        cell?.textLabel?.text = data["title"] as? String
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndex(indexPath.row)
    }
    
    private func selectIndex(_ index: Int) {
        if viewModel.taskDoingList.count == 0 {
            self.selectBlock?([], "")
            return
        }
        let data = viewModel.taskDoingList[index]
        let list = (data["list"] as! Array <ONSWorkModel>)
        self.selectBlock?(list, data["title"] as! NSString)
    }
    
}
