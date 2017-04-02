//
//  ItemManager.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/29/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import Foundation

class ItemManager {
  var todoCount: Int { return todoItems.count }
  var doneCount: Int { return doneItems.count }
  private var todoItems: [ToDoItem] = []
  private var doneItems: [ToDoItem] = []
  
  internal func add(_ todo: ToDoItem) {
    todoItems.append(todo)
  }
  
  internal func item(at index: Int) -> ToDoItem {
    return todoItems[index]
  }
  
  internal func checkItem(at index: Int) {
    let item = todoItems.remove(at: index)
    doneItems.append(item)
  }
  
  internal func doneItem(at index: Int) -> ToDoItem {
    return doneItems[index]
  }
}
