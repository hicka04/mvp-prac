//
//  WeatherViewCell.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/30.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import UIKit

// MARK: -
class WeatherViewCell: UITableViewCell {
    
    // MARK: properties
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var weatherLabel: UILabel!
    
    // MARK: methods
    func setWeather(entity: WeatherEntityProtocol) {
        dateLabel.text = entity.dateString
        weatherLabel.text = entity.weather
    }
}
