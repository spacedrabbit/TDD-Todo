//
//  Location.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/29/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Foundation
import CoreLocation

internal struct Location {
  let name: String
  let coordinate: CLLocationCoordinate2D?
  
  internal init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
    self.name = name
    self.coordinate = coordinate
  }
  
}
