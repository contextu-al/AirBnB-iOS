//
//  BaseCell.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/3/7.
//  Copyright © 2017 Contextual.
//

import UIKit

class BaseTableCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}

