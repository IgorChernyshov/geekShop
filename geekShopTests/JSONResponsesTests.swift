//
//  JSONResponsesTests.swift
//  geekShopTests
//
//  Created by Igor Chernyshov on 24/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import XCTest
@testable import geekShop

class JSONResponsesTests: XCTestCase {
  
  var testBundle: Bundle!
  
  override func setUp() {
    super.setUp()
    testBundle = Bundle(for: type(of: self))
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testAddReviewResponseDecodeSucceed() {
    if let url = testBundle.url(forResource: "addReview", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(AddReviewResponse.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as AddReviewResponse")
  }
  
  func testAddReviewResponseDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(AddReviewResponse.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as AddReviewResponse")
          return
        }
      }
    }
  }
  
  func testApproveReviewResponseDecodeSucceed() {
    if let url = testBundle.url(forResource: "approveReview", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(ApproveReviewResponse.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as ApproveReviewResponse")
  }
  
  func testApproveReviewResponseDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(ApproveReviewResponse.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as ApproveReviewResponse")
          return
        }
      }
    }
  }
  
  func testRemoveReviewResponseDecodeSucceed() {
    if let url = testBundle.url(forResource: "removeReview", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(RemoveReviewResponse.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as RemoveReviewResponse")
  }
  
  func testRemoveReviewResponseDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(RemoveReviewResponse.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as RemoveReviewResponse")
          return
        }
      }
    }
  }
  
  func testChangeUserProfileResponseDecodeSucceed() {
    if let url = testBundle.url(forResource: "changeUserData", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(ChangeUserProfileResponse.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as ChangeUserProfileResponse")
  }
  
  func testChangeUserProfileResponseDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(ChangeUserProfileResponse.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as ChangeUserProfileResponse")
          return
        }
      }
    }
  }
  
  func testLoginResponseDecodeSucceed() {
    if let url = testBundle.url(forResource: "login", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(LoginResponse.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as LoginResponse")
  }
  
  func testLoginResponseDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(LoginResponse.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as LoginResponse")
          return
        }
      }
    }
  }
  
  func testUserDecodeSucceed() {
    if let url = testBundle.url(forResource: "user", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(User.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as User")
  }
  
  func testUserDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(User.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as User")
          return
        }
      }
    }
  }
  
  func testLogoutResponseDecodeSucceed() {
    if let url = testBundle.url(forResource: "logout", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(LogoutResponse.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as LogoutResponse")
  }
  
  func testLogoutResponseDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(LogoutResponse.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as LogoutResponse")
          return
        }
      }
    }
  }
  
  func testRegisterResponseDecodeSucceed() {
    if let url = testBundle.url(forResource: "registerUser", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(RegisterResponse.self, from: data)) != nil {
          return
        }
      }
    }
    XCTFail("Failed to decode JSON response as RegisterResponse")
  }
  
  func testRegisterResponseDecodeFailed() {
    if let url = testBundle.url(forResource: "stub", withExtension: "json") {
      if let data: Data = try? NSData(contentsOf: url) as Data {
        if (try? JSONDecoder().decode(RegisterResponse.self, from: data)) != nil {
          XCTFail("Successfully decoded stub JSON as RegisterResponse")
          return
        }
      }
    }
  }
  
}
