//
//  ErrorParserTests.swift
//  geekShopTests
//
//  Created by Igor Chernyshov on 24/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import XCTest
import Alamofire
@testable import geekShop

class ErrorParserTests: XCTestCase {
  
  var errorParser: ErrorParser!
  
  override func setUp() {
    super.setUp()
    
    errorParser = ErrorParserImplementation()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testCanceledRequestParseSucceed() {
    let error = NSError(domain: "Canceled Request", code: -999, userInfo: nil)
    
    let canceledError = errorParser.parse(error)
    
    XCTAssertEqual(canceledError, AppError.canceledRequest)
  }
  
  func testCanceledRequestParseFailed() {
    let error = NSError(domain: "Canceled Request", code: -999, userInfo: nil)
    
    let canceledError = errorParser.parse(error)
    
    XCTAssertNotEqual(canceledError, AppError.clientError)
  }
  
  func testClientError1001ParseSucceed() {
    let error = NSError(domain: "Client Error", code: -1001, userInfo: nil)
    
    let clientError = errorParser.parse(error)
    
    XCTAssertEqual(clientError, AppError.clientError)
  }
  
  func testClientError1001ParseFailed() {
    let error = NSError(domain: "Client Error", code: -1001, userInfo: nil)
    
    let clientError = errorParser.parse(error)
    
    XCTAssertNotEqual(clientError, AppError.canceledRequest)
  }
  
  func testClientError1005ParseSucceed() {
    let error = NSError(domain: "Client Error", code: -1005, userInfo: nil)
    
    let clientError = errorParser.parse(error)
    
    XCTAssertEqual(clientError, AppError.clientError)
  }
  
  func testClientError1005ParseFailed() {
    let error = NSError(domain: "Client Error", code: -1005, userInfo: nil)
    
    let clientError = errorParser.parse(error)
    
    XCTAssertNotEqual(clientError, AppError.canceledRequest)
  }
  
  func testClientError1009ParseSucceed() {
    let error = NSError(domain: "Client Error", code: -1009, userInfo: nil)
    
    let clientError = errorParser.parse(error)
    
    XCTAssertEqual(clientError, AppError.clientError)
  }
  
  func testClientError1009ParseFailed() {
    let error = NSError(domain: "Client Error", code: -1009, userInfo: nil)
    
    let clientError = errorParser.parse(error)
    
    XCTAssertNotEqual(clientError, AppError.canceledRequest)
  }
  
  func testUnknownErrorParseSucceed() {
    let error = NSError(domain: "Unknown error", code: -777, userInfo: nil)
    
    let unknownError = errorParser.parse(error)
    
    XCTAssertEqual(unknownError, AppError.unknownError)
  }
  
  func testUnknownErrorParseFailed() {
    let error = NSError(domain: "Unknown error", code: -777, userInfo: nil)
    
    let unknownError = errorParser.parse(error)
    
    XCTAssertNotEqual(unknownError, AppError.clientError)
  }
  
}
