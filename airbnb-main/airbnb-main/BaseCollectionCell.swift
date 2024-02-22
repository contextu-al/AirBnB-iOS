//
//  BaseCollectionCell.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/4/3.
//  Copyright © 2017 Contextual.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
