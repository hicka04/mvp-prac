//
//  WeatherDetailViewPresenter.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

protocol WeatherDetailViewEvent {
    var date: String { get }
    var weather: String { get }
    // MARK: - init
    init(entity: WeatherEntity)
    // MARK: - methods
}

class WeatherDetailViewPresenter: WeatherDetailViewEvent {
    let entity: WeatherEntity
    var date: String {
        return entity.dateString
    }
    var weather: String {
        return entity.weather
    }
    
    required init(entity: WeatherEntity) {
        self.entity = entity
    }
}
