//
//  WeatherListViewPresenter.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/28.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

// MARK: -
protocol WeatherListViewPresentable: class {
    // init
    init(view: WeatherListView, modelType: WeatherModelInterface.Type)
    
    // MARK: properties
    var numberOfWeathers: Int { get }
    
    // MARK: methods
    func updateWeathers()
    func entity(at: IndexPath) -> WeatherEntity
    func didSelectRow(at indexPath: IndexPath)
}

// MARK: -
class WeatherListViewPresenter: WeatherListViewPresentable {
    // MARK: properties
    private weak var view: WeatherListView?
    private let model: WeatherModelInterface
    var numberOfWeathers: Int {
        return model.weathers.count
    }
    
    // MARK: init/deinit
    required init(view: WeatherListView, modelType Model: WeatherModelInterface.Type) {
        self.view = view
        self.model = Model.init(api: WeatherRESTAPI.shared())
        self.model.addObserver(self, selector: #selector(self.updated))
    }
    
    deinit {
        model.removeObserver(self)
    }
    
    // MARK: methods
    
    func updateWeathers() {
        model.resetWeathers()
        // api request
        model.fetchWeathers()
    }
    
    func entity(at indexPath: IndexPath) -> WeatherEntity {
        return model.weathers[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        view?.navigateDetail(entity: model.weathers[indexPath.row])
    }
    
    @objc func updated() {
        view?.reloadData()
    }
}
