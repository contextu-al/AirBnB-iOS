//
//  LocationCell.swift
//  airbnb-main
//
//  Created by admin on 2022/12/8.
//  Copyright © 2022 Contextual.
//

import Foundation
import UIKit

class LocationCell: BaseTableCell {
    var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = UIColor.gray
        return view
    }()
    
    override func setupViews() {
        addSubview(descriptionLabel)
        
        descriptionLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor ).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

    }
}
