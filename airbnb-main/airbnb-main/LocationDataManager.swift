//
//  LocationDataManager.swift
//  airbnb-main
//
//  Created by admin on 08/12/2022.
//  Copyright © 2022 Yonas Stephen. All rights reserved.
//

import Foundation

class LocationDataManager {
    private var locations: [LocationItem] = []
    
    private func loadData() -> [[String: String]]{
        let decoder = PropertyListDecoder()
        if let path = Bundle.main.path(forResource: "Locations", ofType: "plist"),
           let locationsData = FileManager.default.contents(atPath: path),
           let locations = try? decoder.decode([[String: String]].self, from: locationsData){
            return locations
        }
        return [[:]]
    }
    
    func fetch(){
        for location in loadData(){
            locations.append(LocationItem(dict: location))
        }
    }
    
    func numberOfLocationItems() -> Int{
        locations.count
    }
    
    func locationItem(at index: Int) -> LocationItem {
        locations[index]
    }
}
