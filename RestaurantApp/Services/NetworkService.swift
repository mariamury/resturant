//
//  NetworkService.swift
//  RestaurantApp
//
//  Created by Maria Mury on 4/9/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "L-0eYSurXAlQA1rNLVeK7IRuIV4iIqJfFiUDEqz9PL8WOTConOiXXUQQ6RegWGbZW7Qd-2f4GyrgnFjgX3w399WfJxd7zNSGMjFzgYczcKv3wzyvnGoLdjXllcysXHYx"

enum YelpService{
    enum BusinessesProvider: TargetType{
        case search(lat: Double, long: Double)
        
        var baseURL: URL{
            return URL(string:"http://api.yelp.com/v3/businesses")!
        }
        
        var path: String{
            switch self{
            case .search:
                return "/search"
            }
        }
        
        var method: Moya.Method{
            return .get
        }
        
        var sampleData: Data{
            return Data()
        }
        
        var task: Task{
            switch self{
            case let .search(lat, long):
                return .requestParameters(parameters:["latitude":lat,"longitude":long,"limit": 10], encoding: URLEncoding.queryString)
            }
        }
        var headers: [String : String]?{
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
