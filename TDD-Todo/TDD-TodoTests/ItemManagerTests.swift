//
//  ItemManagerTests.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/29/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import XCTest
@testable import TDD_Todo

class ItemManagerTests: XCTestCase {
  
  var sut: ItemManager!
  
  override func setUp() {
    super.setUp()
    sut = ItemManager()
  }
  override func tearDown() { super.tearDown() }
  
  func test_ToDoCount_Initially_IsZero() {
    XCTAssertEqual(sut.todoCount, 0)
  }
  
  func test_DoneCount_Initially_IsZero() {
    XCTAssertEqual(sut.doneCount, 0)
  }
  
  func test_AddItem_Increases_TodoCountToOne() {
    sut.add(ToDoItem(title: ""))
    XCTAssertEqual(sut.todoCount, 1)
  }
}
