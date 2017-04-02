//
//  ToDoItemTests.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/29/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import XCTest
@testable import TDD_Todo

class ToDoItemTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func test_Init_WhenGivenTitle_SetsTitle() {
    let todo = ToDoItem(title: "Test Title")
    
    XCTAssertEqual(todo.title, "Test Title", "should set title")
  }
  
  func test_Init_WhenGivenDescription_SetsDescription() {
    let todo = ToDoItem(title: "Test Title", itemDescription: "Test Description")
    
    XCTAssertEqual(todo.itemDescription, "Test Description", "Should Set Item Description")
  }
  
  func test_Init_WhenGivenTimeStamp_SetsTimeStamp() {
    let todo = ToDoItem(title: "Test Title", timestamp: 0.0)
    
    XCTAssertEqual(todo.timestamp, 0.0, "should set time stamp")
  }
  
  func test_Init_WhenGivenLocation_SetsLocation() {
    let location = Location(name: "test location")
    let todo = ToDoItem(title: "test title", location: location)
    
    XCTAssertEqual(todo.location?.name, location.name)
  }
  
  // Implementing Equatable
  
}
