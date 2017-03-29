//
//  ToDoItem.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/29/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Foundation


internal struct ToDoItem {
  let title: String!
  let itemDescription: String?
  let timestamp: Double?
  let location: Location?
  
  internal init(title: String, itemDescription: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
    self.title = title
    self.itemDescription = itemDescription
    self.timestamp = timestamp
    self.location = location
  }
  
  
}
