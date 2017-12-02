//
//  WeatherMockAPI.swift
//  mvp-pracTests
//
//  Created by HikaruSato on 2017/12/01.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherMockAPI: WeatherAPI {
    func fetchWeathers(completion: @escaping (JSON) -> Void) {
        if let filepath = Bundle.main.path(forResource: "WeatherDataMock", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: filepath)) {
            completion(JSON(data))
        } else {
            fatalError()
        }
    }
}
