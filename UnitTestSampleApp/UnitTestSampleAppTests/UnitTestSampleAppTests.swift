//
//  UnitTestSampleAppTests.swift
//  UnitTestSampleAppTests
//
//  Created by 尾原徳泰 on 2020/10/11.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import XCTest
@testable import UnitTestSampleApp

class UnitTestSampleAppTests: XCTestCase {
    func testMySample() {
        let mySample = MySample()
        let add = mySample.add(num1: 2, num2: 3)
        
        XCTAssertEqual(add, 4)
    }
}
