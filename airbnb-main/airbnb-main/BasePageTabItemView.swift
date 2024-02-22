//
//  BasePageTabView.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/3/13.
//  Copyright © 2017 Contextual.
//

import UIKit

class BasePageTabItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func layoutSubviews() {
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
