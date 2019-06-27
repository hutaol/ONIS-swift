//
//  HTPopView.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/5.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

class HTPopView: UIView, UITableViewDelegate, UITableViewDataSource {
   
    var dataSource = NSMutableArray()
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView.init(frame: frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.setBorderRaidus(radius: 5, width: 1, color: UIColor.gray)
        self.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        kAppWindow??.addSubview(self)
    }
    
    func hide() {
        tableView.removeFromSuperview()
        self.removeFromSuperview()
        kAppWindow??.removeFromSuperview()
    }
}

extension HTPopView {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        return cell
    }
    
}
