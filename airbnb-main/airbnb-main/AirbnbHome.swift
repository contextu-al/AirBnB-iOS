//
//  AirbnbHome.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 2017/4/3.
//  Copyright © 2017 Contextual.
//

import Foundation

class AirbnbHome {
    var imageName: String
    var homeDescription: String
    var price: Int
    var rating: Double
    var reviewCount: Int
    
    init(imageName: String, description: String, price: Int, reviewCount: Int, rating: Double) {
        self.imageName = imageName
        self.homeDescription = description
        self.price = price
        self.reviewCount = reviewCount
        self.rating = rating
    }
}
