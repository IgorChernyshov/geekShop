//
//  JSONResponsesTests.swift
//  geekShopTests
//
//  Created by Igor Chernyshov on 24/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import XCTest
@testable import geekShop

/*
 This class tests if JSON stubs that are identical to responses from the server are parsed succesfully
 */

class JSONResponsesTests: XCTestCase {
  
  var testBundle: Bundle!
  
  override func setUp() {
    super.setUp()
    testBundle = Bundle(for: type(of: self))
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func successfullyDecode<T: Codable>(json: String, as codable: T.Type) {
    guard let url = testBundle.url(forResource: json, withExtension: "json"),
      let data: Data = try? NSData(contentsOf: url) as Data,
      let _: T = try? JSONDecoder().decode(T.self, from: data) else {
        XCTFail("Failed to decode JSON response as \(T.self)")
        return
    }
  }
  
  func failToDecode<T: Codable>(codable: T.Type) {
    guard let url = testBundle.url(forResource: "stub", withExtension: "json"),
      let data: Data = try? NSData(contentsOf: url) as Data,
      let _: T = try? JSONDecoder().decode(T.self, from: data) else {
        return
    }
    XCTFail("Successfully decoded stub JSON as \(T.self)")
  }
  
  // MARK: - Review-related tests
  
  func testAddReviewResponseDecodeSucceed() {
    successfullyDecode(json: "addReview", as: AddReviewResponse.self)
  }
  
  func testAddReviewResponseDecodeFailed() {
    failToDecode(codable: AddReviewResponse.self)
  }
  
  func testApproveReviewResponseDecodeSucceed() {
    successfullyDecode(json: "approveReview", as: ApproveReviewResponse.self)
  }
  
  func testApproveReviewResponseDecodeFailed() {
    failToDecode(codable: ApproveReviewResponse.self)
  }
  
  func testRemoveReviewResponseDecodeSucceed() {
    successfullyDecode(json: "removeReview", as: RemoveReviewResponse.self)
  }
  
  func testRemoveReviewResponseDecodeFailed() {
    failToDecode(codable: RemoveReviewResponse.self)
  }
  
  // MARK: - User's account-related tests
  
  func testChangeUserProfileResponseDecodeSucceed() {
    successfullyDecode(json: "changeUserData", as: ChangeUserProfileResponse.self)
  }
  
  func testChangeUserProfileResponseDecodeFailed() {
   failToDecode(codable: ChangeUserProfileResponse.self)
  }
  
  func testLoginResponseDecodeSucceed() {
    successfullyDecode(json: "login", as: LoginResponse.self)
  }
  
  func testLoginResponseDecodeFailed() {
    failToDecode(codable: LoginResponse.self)
  }
  
  func testUserDecodeSucceed() {
    successfullyDecode(json: "user", as: User.self)
  }
  
  func testUserDecodeFailed() {
    failToDecode(codable: User.self)
  }
  
  func testLogoutResponseDecodeSucceed() {
    successfullyDecode(json: "logout", as: LogoutResponse.self)
  }
  
  func testLogoutResponseDecodeFailed() {
    failToDecode(codable: LoginResponse.self)
  }
  
  func testRegisterResponseDecodeSucceed() {
    successfullyDecode(json: "registerUser", as: RegisterResponse.self)
  }
  
  func testRegisterResponseDecodeFailed() {
    failToDecode(codable: RegisterResponse.self)
  }
  
  // MARK: - Basket-related tests
  
  func testAddItemToBasketResponseDecodeSucceed() {
    successfullyDecode(json: "addItemToBasket", as: AddItemToBasketResponse.self)
  }
  
  func testAddItemToBasketResponseDecodeFailed() {
    failToDecode(codable: AddItemToBasketResponse.self)
  }
  
  func testSuccessfullyGotItemsListResponseDecodeSucceed() {
    successfullyDecode(json: "successfullyGotItemsList", as: GetItemsListResponse.self)
  }
  
  func testSuccessfullyGotItemsListResponseDecodeFailed() {
    failToDecode(codable: GetItemsListResponse.self)
  }
  
  func testFailedToGetItemsListResponseDecodeSucceed() {
    successfullyDecode(json: "failedToGetItemsList", as: GetItemsListResponse.self)
  }
  
  func testFailedToGetItemsListResponseDecodeFailed() {
    failToDecode(codable: GetItemsListResponse.self)
  }
  
  func testItemResponseDecodeSucceed() {
    successfullyDecode(json: "item", as: Item.self)
  }
  
  func testItemResponseDecodeFailed() {
    failToDecode(codable: Item.self)
  }
  
  func testSuccessfullyGotUsersBasketResponseDecodeSucceed() {
    successfullyDecode(json: "successfullyGotUsersBasket", as: GetUsersBasketResponse.self)
  }
  
  func testSuccessfullyGotUsersBasketResponseDecodeFailed() {
    failToDecode(codable: GetUsersBasketResponse.self)
  }
  
  func testFailedToGetUsersBasketResponseDecodeSucceed() {
    successfullyDecode(json: "failedToGetUsersBasket", as: GetUsersBasketResponse.self)
  }
  
  func testFailedToGetUsersBasketResponseDecodeFailed() {
    failToDecode(codable: GetUsersBasketResponse.self)
  }
  
  func testItemInBasketResponseDecodeSucceed() {
    successfullyDecode(json: "itemInBasket", as: ItemInBasket.self)
  }
  
  func testItemInBasketResponseDecodeFailed() {
    failToDecode(codable: ItemInBasket.self)
  }
  
  func testRemoveItemFromBasketResponseDecodeSucceed() {
    successfullyDecode(json: "removeItemFromBasket", as: RemoveItemFromBasketResponse.self)
  }
  
  func testRemoveItemFromBasketResponseDecodeFailed() {
    failToDecode(codable: RemoveItemFromBasketResponse.self)
  }
  
}
