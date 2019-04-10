//
//  Models.swift
//  RestaurantApp
//
//  Created by Maria Mury on 4/9/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import Foundation

struct Root: Codable{
    let businesses: [Business]
}


struct Business: Codable{
    let name: String
    let imageUrl: URL
    let distance: Double
    let id: String
}

struct RestaurantListViewModel{
    let name: String
    let imageUrl: URL
    let distance:String
    let id: String
}

extension RestaurantListViewModel{
    init(business: Business){
        self.name = business.name
        self.id = business.id
        self.imageUrl = business.imageUrl
        self.distance = "\(business.distance/1609.344)"
        
    }
}
