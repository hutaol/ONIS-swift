//
//  HTChoiceButton.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

enum HTImageMode {
    case left
    case right
}

class HTChoiceButton: UIButton {
    
    typealias OnClickBlock = () -> Void
    open var onClickBlock:OnClickBlock?
    
    open var mode = HTImageMode.left
    open var imageName = String() {
        didSet {
            image.image = UIImage.init(named: imageName)
        }
    }
    open var titleName = String() {
        didSet {
            title.text = titleName
        }
    }
    open var image = UIImageView()
    open var title = UILabel()
    open var choice = Bool() {
        didSet {
            if choice {
                image.image = UIImage.init(named: imageName)
            } else {
                image.image = nil
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.choice = true
        self.addSubview(image)
        self.addSubview(title)
        
        image.layer.borderColor = UIColor.gray.cgColor
        image.layer.borderWidth = 1
        
        title.textAlignment = .center
        
        self.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margin = (self.frame.size.height-20.0)/2
        image.frame = CGRect.init(x: margin, y: margin, width: 20, height: 20)
        
        title.frame = CGRect.init(x: self.frame.size.height, y: 0, width: self.frame.size.width-self.frame.size.height, height: self.frame.size.height)

    }
    
    @objc func onClick() {
        self.choice = !self.choice
        self.onClickBlock?()
        
    }
    
}
