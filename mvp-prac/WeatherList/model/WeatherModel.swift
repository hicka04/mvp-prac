//
//  WeatherModel.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol WeatherModelProtocol: class {
    var notificationName: Notification.Name { get }
    var weathers: [WeatherEntityProtocol] { get }
    
    func getWeathers()
    func resetWeathers()
}

class WeatherModel: WeatherModelProtocol {
    static let shared = WeatherModel()
    let notificationName = Notification.Name(rawValue: "weathers")
    private(set) var weathers: [WeatherEntityProtocol] = []
    private let url = API.url
    
    private init() { }
    
    func resetWeathers() {
        weathers = []
        
        notify()
    }
    
    func getWeathers() {
        // api request...
        Alamofire.request(url).responseJSON { response in
            if let jsonArray = JSON(data: response.data!)["list"].array {
                jsonArray.forEach({ (data) in
                    let dt = data["dt_txt"].string!
                    let weather = data["weather"][0]["main"].string!
                    self.weathers.append(WeatherEntity(dateString: dt, weather: weather))
                })
            }
            
            self.notify()
        }
    }
    
    func notify() {
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}
