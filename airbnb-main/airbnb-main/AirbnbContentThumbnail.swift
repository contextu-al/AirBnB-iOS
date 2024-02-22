//
//  AirbnbContentThumbnail.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/3/7.
//  Copyright © 2017 Contextual.
//

import UIKit

class AirbnbContentThumbnail {
    var thumbail: UIImage?
    var price: Double?
    var description: String?
    var review: Int?
    var type: AirbnbContentThumbnailType?
    
    init() {
    }
}

enum AirbnbContentThumbnailType: Int {
    case Home = 0, Experience, Place
}
