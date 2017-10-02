//
//  WeatherDetailViewPresenter.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

protocol WeatherDetailViewPresenterProtocol {
    // MARK: - init
    init(entity: WeatherEntityProtocol)
    // MARK: - methods
    // TODO: Viewに表示したい内容を返すメソッド追加
}

class WeatherDetailViewPresenter: WeatherDetailViewPresenterProtocol {
    let entity: WeatherEntityProtocol
    
    required init(entity: WeatherEntityProtocol) {
        self.entity = entity
    }
}
