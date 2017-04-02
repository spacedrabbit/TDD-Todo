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
  
  // We set this up with the intention that our System Under Test
  // gets reset for each run
  override func setUp() {
    super.setUp()
    sut = ItemManager()
  }
  override func tearDown() { super.tearDown() }
  
  // Checks are done on the initial states of the SUT
  func test_ToDoCount_Initially_IsZero() {
    XCTAssertEqual(sut.todoCount, 0)
  }
  
  func test_DoneCount_Initially_IsZero() {
    XCTAssertEqual(sut.doneCount, 0)
  }
  
  // We check to see that counts get updated properly
  func test_AddItem_Increases_TodoCountToOne() {
    sut.add(ToDoItem(title: ""))
    XCTAssertEqual(sut.todoCount, 1)
  }
  
  // However, just because the count is correct, it doesn't mean
  // that the expected item is in the right place, so we add this check
  func test_ItemAt_AfterAddingItem_ReturnsThatItem() {
    let item = ToDoItem(title: "test")
    sut.add(item)
    
    let returnedItem = sut.item(at: 0)
    XCTAssertEqual(item.title, returnedItem.title)
  }
  
  
  // Now this check is added to make sure counts are correct,
  // But again, we need another test to ensure we get the correct items back
  func test_CheckItemAt_ChangesCount() {
    sut.add(ToDoItem(title: "Test"))
    sut.checkItem(at: 0)
    
    XCTAssertEqual(sut.todoCount, 0)
    XCTAssertEqual(sut.doneCount, 1)
  }
  
  func test_CheckItemAt_RemovesFromToDoItems() {
    let first = ToDoItem(title: "First")
    let second = ToDoItem(title: "Second")
    sut.add(first)
    sut.add(second)
    
    sut.checkItem(at: 0)
    XCTAssertEqual(sut.item(at: 0).title, "Second")
  }
  
  func test_DoneItemAt_ReturnsCheckedItem() {
    let item = ToDoItem(title: "Test")
    sut.add(item)
    
    sut.checkItem(at: 0)
    let returnedItem = sut.doneItem(at: 0)
    
    XCTAssertEqual(item.title, returnedItem.title)
  }
}
