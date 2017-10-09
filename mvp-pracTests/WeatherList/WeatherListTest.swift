//
//  WeatherListTest.swift
//  mvp-pracTests
//
//  Created by HikaruSato on 2017/10/05.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import XCTest

class WeatherListTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPresenter() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let presenter = WeatherListViewPresenter(model: WeatherModelMock.shared)
        // MARK: numberOfWeathers
        XCTAssert(presenter.numberOfWeathers == 0)
        WeatherModelMock.shared.getWeathers()
        XCTAssert(presenter.numberOfWeathers > 1)
        
        // MARK: attachView
        
        
        // MARK: entity(at:)
        let results = [
            ["2017-10-07 00:00:00", "Sunny"],
            ["2017-10-07 03:00:00", "Rainy"],
            ["2017-10-07 06:00:00", "Cloudy"],
            ["2017-10-07 09:00:00", "Sunny"]
        ]
        results.enumerated().forEach { (offset: Int, result: [String]) in
            let entity = presenter.entity(at: IndexPath(row: offset, section: 0))
            XCTAssertEqual([entity.dateString, entity.weather], result)
        }
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
