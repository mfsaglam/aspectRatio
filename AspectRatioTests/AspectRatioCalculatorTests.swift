//
//  AspectRatioCalculatorTests.swift
//  AspectRatioTests
//
//  Created by Fatih Sağlam on 11.11.2022.
//

import XCTest
@testable import AspectRatio

final class AspectRatioCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Calculate_wh_1920by1080is16by9() {
        let sut = AspectRatioCalculator()
        
        let result = sut.calculate(width: 1920, height: 1080, format: .widthAndHeightBased)
        
        XCTAssertEqual(result, "16:9")
    }
    
    func test_Calculate_one_1920by1080is178by1() {
        let sut = AspectRatioCalculator()
        
        let result = sut.calculate(width: 1920, height: 1080, format: .oneBased)
        
        XCTAssertEqual(result, "1.78:1")
    }
    
    func test_Calculate_diagonal_1920by1080is2202() {
        let sut = AspectRatioCalculator()
        
        let result = sut.calculate(width: 1920, height: 1080, format: .diagonal)
        
        XCTAssertEqual(result, "2202.91")
    }

}
