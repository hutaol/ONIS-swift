//
//  ONSLoginTextField.swift
//  OnisMobile-Swift
//
//  Created by Henry on 2019/6/4.
//  Copyright © 2019 eastraycloud. All rights reserved.
//

import UIKit

class ONSLoginTextField: UITextField {

    lazy var leftImageView: UIImageView = {
        let image = UIImageView.init()
        image.contentMode = .center
        return image
    }()
    
    open var leftImage = NSString() {
        didSet {
            if leftImage.length > 0 {
                self.addSubview(leftImageView)
                leftImageView.image = UIImage.init(named: leftImage as String)
                self.leftView = leftImageView
                self.leftViewMode = .always
            }
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clearButtonMode = .whileEditing
        self.autocapitalizationType = .none
        self.contentMode = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if leftImage.length > 0 {
            leftImageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height)
        }
        
    }
    
}
