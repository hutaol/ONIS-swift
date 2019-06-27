//
//  HTCollectionViewController.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/5.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

class HTCollectionViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}


