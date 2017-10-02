//
//  WeatherViewCell.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/30.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import UIKit

class WeatherViewCell: UITableViewCell {
    
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var weatherLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setWeather(entity: WeatherEntityProtocol) {
        dateLabel.text = entity.dateString
        weatherLabel.text = entity.weather
    }
}
