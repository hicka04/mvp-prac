//
//  API.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/03.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import UIKit

struct API {
    private init() { }
    
    private static let uri = "http://api.openweathermap.org"
    private static let path = "/data/2.5/forecast"
    private static let appid = "APPID=fe2e030505a9e85c3b588451b6a3faa8"
    
    static var url: String {
        return "\(uri)\(path)?\(appid)&q=Tokyo"
    }
}
