//
//  WeatherDetailViewPresenter.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

protocol WeatherDetailViewPresenterProtocol {
    var date: String { get }
    var weather: String { get }
    // MARK: - init
    init(entity: WeatherEntityProtocol)
    // MARK: - methods
}

class WeatherDetailViewPresenter: WeatherDetailViewPresenterProtocol {
    let entity: WeatherEntityProtocol
    var date: String {
        return entity.dateString
    }
    var weather: String {
        return entity.weather
    }
    
    required init(entity: WeatherEntityProtocol) {
        self.entity = entity
    }
}
