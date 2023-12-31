//
//  LocationItem.swift
//  airbnb-main
//
//  Created by admin on 08/12/2022.
//  Copyright © 2022 Yonas Stephen. All rights reserved.
//

import Foundation

struct LocationItem: Equatable {
    let city: String?
    let state: String?
}

extension LocationItem {
    init(dict: [String: String]){
        self.city = dict["city"]
        self.state = dict["state"]
    }
    
    var cityAndState: String {
        guard let city = self.city, let state = self.state else {
            return ""
        }
        return "\(city) \(state)"
    }
}
