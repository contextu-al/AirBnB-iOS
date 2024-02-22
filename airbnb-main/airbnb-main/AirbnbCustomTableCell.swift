//
//  AirbnbCustomTableCell.swift
//  airbnb-main
//
//  Created by Marc Stroebel on 2023/11/8.
//  Copyright © 2023 Contextual.
//

import UIKit

class AirbnbCustomTableCell: BaseTableCell {
    
    var category: AirbnbCategoryModel? {
        didSet {
            self.baseImageView.loadImage(from: self.category?.imageUrl)
        }
    }
    
    var baseImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(baseImageView)
        
        baseImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        baseImageView.heightAnchor.constraint(equalToConstant: self.category?.rowHeight ?? 300).isActive = true
        
        baseImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        baseImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
}
