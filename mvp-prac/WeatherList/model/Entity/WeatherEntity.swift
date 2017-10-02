//
//  WeatherModel.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/30.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

protocol WeatherEntityProtocol {
    // MARK: properties
    var dateString: String { get }
    var weather: String { get }
    
    // MARK: init
    init(dateString: String, weather: String)
}

struct WeatherEntity: WeatherEntityProtocol {
    // MARK: properties
    var dateString: String
    let weather: String
    
    // MARK: init
    init(dateString: String, weather: String) {
        self.dateString = dateString
        self.weather = weather
    }
}
