//
//  WeatherListViewPresenter.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/28.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

// MARK: -
protocol WeatherListViewPresenterProtocol: class {
    // MARK: properties
    var numberOfWeathers: Int { get }
    
    // MARK: init
    init(view: WeatherListViewProtocol)
    
    // MARK: methods
    func updateWeathers()
    func entity(at: IndexPath) -> WeatherEntityProtocol
    func didSelectRow(at indexPath: IndexPath)
}

// MARK: -
class WeatherListViewPresenter: WeatherListViewPresenterProtocol {
    // MARK: properties
    let view: WeatherListViewProtocol
    let model: WeatherModelProtocol
    var numberOfWeathers: Int {
        return model.weathers.count
    }
    
    // MARK: init/deinit
    required init(view: WeatherListViewProtocol) {
        self.view = view
        model = WeatherModel.shared
        model.addObserver(self, selector: #selector(self.updated))
    }
    
    deinit {
        model.removeObserver(self)
    }
    
    // MARK: methods
    func updateWeathers() {
        model.resetWeathers()
        // api request
        model.getWeathers()
    }
    
    func entity(at indexPath: IndexPath) -> WeatherEntityProtocol {
        return model.weathers[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        view.navigateDetail(entity: model.weathers[indexPath.row])
    }
    
    @objc private func updated() {
        view.reloadData()
    }
}
