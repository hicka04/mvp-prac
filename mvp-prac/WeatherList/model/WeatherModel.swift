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

// MARK: -
protocol WeatherModelNotify: class {
    // MARK: methods
    func addObserver(_ observer: Any, selector: Selector)
    func removeObserver(_ observer: Any)
}

// MARK: -
protocol WeatherModelProtocol: class, WeatherModelNotify {
    // MARK: properties
    var weathers: [WeatherEntityProtocol] { get }
    
    // MARK: methods
    func getWeathers()
    func resetWeathers()
}

// MARK: -
class WeatherModel: WeatherModelProtocol {
    // MARK: properties
    static let shared = WeatherModel()
    private(set) var weathers: [WeatherEntityProtocol] = []
    private let url = API.url
    
    // MARK: init
    private init() { }
    
    // MARK: methods
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
}

// MARK: - notify
extension WeatherModel: WeatherModelNotify {
    // MARK: properties
    var notificationName: Notification.Name {
        return Notification.Name(rawValue: "weathers")
    }

    // MARK: methods
    func addObserver(_ observer: Any, selector: Selector) {
        NotificationCenter.default.addObserver(observer,
                                               selector: selector,
                                               name: notificationName,
                                               object: nil)
    }

    func removeObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }

    func notify() {
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
}
