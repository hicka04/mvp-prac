//
//  WeatherModel.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: -
protocol WeatherModelNotify: class {
    // MARK: methods
    func addObserver(_ observer: Any, selector: Selector)
    func removeObserver(_ observer: Any)
}

// MARK: -
protocol WeatherModelInterface: WeatherModelNotify {
    // MARK: properties
    var weathers: [WeatherEntity] { get }
    
    // MARK: init
    init(api: WeatherAPI)
    
    // MARK: methods
    func fetchWeathers()
    func resetWeathers()
}

// MARK: -
class WeatherModel: WeatherModelInterface {
    // MARK: properties
    private(set) var weathers: [WeatherEntity] = []
    private let api: WeatherAPI
    
    // MARK: init
    required init(api: WeatherAPI) {
        self.api = api
    }
    
    // MARK: methods
    func resetWeathers() {
        weathers = []
        
        notify()
    }
    
    func fetchWeathers() {
        // api request...
        api.fetchWeathers { (json) in
            if let jsonArray = json["list"].array {
                jsonArray.forEach({ (data) in
                    let dt = data["dt_txt"].string!
                    let weather = data["weather"][0]["main"].string!
                    self.weathers.append(WeatherEntity(dateString: dt, weather: weather))
                })
                
                self.notify()
            }
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
