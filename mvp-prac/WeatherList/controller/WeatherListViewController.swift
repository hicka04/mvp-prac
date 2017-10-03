//
//  WeatherListViewController.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/09/27.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import UIKit

// MARK: -
protocol WeatherListViewProtocol: class {
    // MARK: methods
    func reloadData()
    func navigateDetail(entity: WeatherEntityProtocol)
}

// MARK: -
class WeatherListViewController: UIViewController {
    // MARK: properties
    @IBOutlet private var tableView: UITableView!
    
    private let CELL_IDENTIFIER = "cell"
    
    let presenter: WeatherListViewPresenter
    
    // MARK: init/deinit
    init(presenter: WeatherListViewPresenter) {
        self.presenter = presenter
        
        super.init(nibName: "WeatherListViewController", bundle: nil)
        
        self.presenter.attachView(view: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(self.updateWeathers), for: .valueChanged)
        tableView.register(UINib(nibName: "WeatherViewCell", bundle: nil), forCellReuseIdentifier: CELL_IDENTIFIER)
        
        // load weathers
        updateWeathers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    @objc func updateWeathers() {
        presenter.updateWeathers()
        tableView.refreshControl?.beginRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - protocol methods
extension WeatherListViewController: WeatherListViewProtocol {
    func reloadData() {
        tableView.refreshControl?.endRefreshing()
        
        tableView.reloadData()
    }
    
    func navigateDetail(entity: WeatherEntityProtocol) {
        let detailViewController = WeatherDetailViewController(entity: entity)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - tableview delegate datasource
extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfWeathers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! WeatherViewCell
        cell.setWeather(entity: presenter.entity(at: indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}
