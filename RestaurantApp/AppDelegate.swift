//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by Gary Tokman on 2/25/18.
//  Copyright © 2018 Gary Tokman. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()
    let locationService = LocationService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let service = MoyaProvider<YelpService.BusinessesProvider>()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        service.request(.search(lat:25.758763199999997, long:-80.3736024)) { (result) in
            switch result{
            case .success(let response):
                print(try? JSONSerialization.jsonObject(with: response.data, options: []))
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
        switch locationService.status {
        case .notDetermined, .denied, .restricted:
            let locationViewController = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
            locationViewController?.locationService = locationService
            window.rootViewController = locationViewController
        default:
            assertionFailure()
        }
        window.makeKeyAndVisible()
        
        return true
    }
}
