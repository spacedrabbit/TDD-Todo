//
//  LocationTests.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/29/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import XCTest
import Foundation
import CoreLocation
@testable import TDD_Todo

class LocationTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func test_Init_WhenGivenName_SetsName() {
    let location = Location(name: "location")
    
    XCTAssertEqual(location.name, "location")
  }
  
  func test_Init_WhenGivenCoord_SetsCoord() {
    let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
    let location = Location(name: "", coordinate: coordinate)
    
    XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
    XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
  }
  
  
  
}
