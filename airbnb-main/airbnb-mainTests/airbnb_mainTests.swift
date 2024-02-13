//
//  airbnb_mainTests.swift
//  airbnb-mainTests
//
//  Created by Amr Aboelela on 2024/2/13.
//  Copyright © 2024 Contextual.
//

import XCTest

@testable import airbnb_main

final class airbnb_mainTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testLastTwoTokensWithValidInput() {
        let input = "airbnbContextual://tab/profile"
        
        var (token1, token2) = input.lastTwoTokens(delimiter: "/")
        
        XCTAssertNotNil(token1)
        XCTAssertNotNil(token2)
        XCTAssertEqual(token1, "tab")
        XCTAssertEqual(token2, "profile")
        
        (token1, token2) = input.lastTwoTokens()
        
        XCTAssertNotNil(token1)
        XCTAssertNotNil(token2)
        XCTAssertEqual(token1, "tab")
        XCTAssertEqual(token2, "profile")
    }
    
    func testLastTwoTokensWithNotEnoughTokens() {
        let input = "singleToken"
        
        let (token1, token2) = input.lastTwoTokens(delimiter: "/")
        
        XCTAssertNil(token1)
        XCTAssertNil(token2)
    }
    
    func testLastTwoTokensWithEmptyString() {
        let input = ""
        
        let (token1, token2) = input.lastTwoTokens(delimiter: "/")
        
        XCTAssertNil(token1)
        XCTAssertNil(token2)
    }
    
}
