//
//  WeatherModel.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/30.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

protocol WeatherEntityProtocol {
    init(dateString: String, weather: String)
    
    var dateString: String { get }
    var weather: String { get }
}

struct WeatherEntity: WeatherEntityProtocol {
    var dateString: String
    let weather: String
    
    init(dateString: String, weather: String) {
        self.dateString = dateString
        self.weather = weather
    }
}
