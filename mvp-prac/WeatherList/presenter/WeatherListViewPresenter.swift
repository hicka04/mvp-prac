//
//  WeatherListViewPresenter.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/28.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation

protocol WeatherListViewPresenterProtocol: class {
    // MARK: - properties
    var numberOfWeathers: Int { get }
    
    // MARK: - init
    init(view: WeatherListViewProtocol)
    
    // MARK: - methods
    func updateWeathers()
    func entity(at: IndexPath) -> WeatherEntityProtocol
    func didSelectRow(at indexPath: IndexPath)
}

class WeatherListViewPresenter: WeatherListViewPresenterProtocol {
    // MARK: - properties
    let view: WeatherListViewProtocol
    let model: WeatherModelProtocol
    var numberOfWeathers: Int {
        return model.weathers.count
    }
    
    // MARK: - init/deinit
    required init(view: WeatherListViewProtocol) {
        self.view = view
        self.model = WeatherModel.shared
        addObserver()
    }
    
    deinit {
        removeObserver()
    }
    
    // MARK: - methods
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
}

// MARK: - Notification
extension WeatherListViewPresenter {
    private func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updated),
                                               name: model.notificationName,
                                               object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func updated() {
        view.reloadData()
    }
}
