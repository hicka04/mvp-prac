//
//  WeatherDailyEntity.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/04.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import UIKit

protocol WeatherDailyEntityProtocol {
    // MARK: properties
    var dateString: String { get }
    var weathers: [WeatherEntityProtocol] { get }
    
    // MARK: init
    init(dateString: String, weathers: [WeatherEntityProtocol])
}

struct WeatherDailyEntity: WeatherDailyEntityProtocol {
    // MARK: properties
    let dateString: String
    let weathers: [WeatherEntityProtocol]
    
    // MARK: init
    init(dateString: String, weathers: [WeatherEntityProtocol]) {
        self.dateString = dateString
        self.weathers = weathers
    }
}
