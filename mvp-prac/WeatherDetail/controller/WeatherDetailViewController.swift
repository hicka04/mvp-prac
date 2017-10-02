//
//  WeatherDetailViewController.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    let presenter: WeatherDetailViewPresenterProtocol
    
    init(entity: WeatherEntityProtocol) {
        self.presenter = WeatherDetailViewPresenter(entity: entity)
        
        super.init(nibName: "WeatherDetailViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: presenterから表示に必要なデータをもらってViewにセットする
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
