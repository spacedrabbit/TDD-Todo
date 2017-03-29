//
//  ItemManager.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/29/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Foundation

class ItemManager {
  var todoCount: Int = 0
  var doneCount: Int = 0
  
  internal func add(_ todo: ToDoItem) {
    todoCount += 1
  }
}
