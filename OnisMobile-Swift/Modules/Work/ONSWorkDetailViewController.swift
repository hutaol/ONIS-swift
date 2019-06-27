//
//  ONSWorkDetailViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

class ONSWorkDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // cellID
    private let ONSWorkCollectionViewCellID     = "ONSWorkCollectionViewCellID"

    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    var dataSource = Array<Any>()
    var cellWidth = CGFloat()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionView.backgroundColor = .white
        cellWidth = self.view.width-20

        collectionView.register(ONSWorkCollectionViewCell.self, forCellWithReuseIdentifier: ONSWorkCollectionViewCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if self.view.width > 600 {
            // 横屏
            cellWidth = (self.view.width-30)/2
        } else {
            cellWidth = self.view.width-20
        }
    }
    
    open func updateData(_ list: Array<Any>) {
        dataSource = list
        collectionView.reloadData()
    }

}

extension ONSWorkDetailViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ONSWorkCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ONSWorkCollectionViewCellID, for: indexPath) as! ONSWorkCollectionViewCell
        let workModel: ONSWorkModel = (dataSource[indexPath.row] as? ONSWorkModel ?? nil)!
        cell.title.text = workModel.subject
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let webVC = HTWebViewController.init(url: "http://www.baidu.com")
        
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: cellWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
