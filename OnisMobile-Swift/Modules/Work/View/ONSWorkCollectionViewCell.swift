//
//  ONSWorkCollectionViewCell.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/10.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

class ONSWorkCollectionViewCell: UICollectionViewCell {
    
    lazy var title: UILabel = {
        let label = UILabel.init()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView.init()
        image.image = UIImage.init(named: "arrow_right")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .groupTableViewBackground
        self.layer.cornerRadius = 8
        self.addSubview(title)
        self.addSubview(image)
        
        image.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.width.height.equalTo(16)
        }
        title.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalTo(image.snp_left).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
