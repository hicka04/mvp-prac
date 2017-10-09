//
//  WeatherModelMock.swift
//  mvp-pracTests
//
//  Created by HikaruSato on 2017/10/05.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//
//
//  WeatherModel.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

// MARK: -
class WeatherModelMock: WeatherModelProtocol {
    
    // MARK: properties
    static let shared = WeatherModelMock()
    private(set) var weathers: [WeatherEntityProtocol] = []
//    private let url = API.url
    
    // MARK: init
    private init() { }
    
    // MARK: methods
    func resetWeathers() {
        weathers = []
        
        notify()
    }
    
    func getWeathers() {
        self.weathers.append(WeatherEntity(dateString: "2017-10-07 00:00:00", weather: "Sunny"))
        self.weathers.append(WeatherEntity(dateString: "2017-10-07 03:00:00", weather: "Rainy"))
        self.weathers.append(WeatherEntity(dateString: "2017-10-07 06:00:00", weather: "Cloudy"))
        self.weathers.append(WeatherEntity(dateString: "2017-10-07 09:00:00", weather: "Sunny"))
        
        self.notify()
    }
}

// MARK: - notify
extension WeatherModelMock: WeatherModelNotify {
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
