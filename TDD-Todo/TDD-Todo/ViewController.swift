//
//  ViewController.swift
//  TDD-Todo
//
//  Created by Louis Tur on 3/26/17.
//  Copyright © 2017 catthoughts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var inactiveQueue: DispatchQueue!
  var executeQueuesButton: UIButton = UIButton(type: UIButtonType.roundedRect)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    executeQueuesButton.setTitle("Run Queues", for: .normal)
    executeQueuesButton.setTitleColor(.blue, for: .normal)
    
    self.view.addSubview(executeQueuesButton)
    self.executeQueuesButton.translatesAutoresizingMaskIntoConstraints = false
    executeQueuesButton.addTarget(self, action: #selector(executeQueues), for: .touchUpInside)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.executeQueuesButton.center = self.view.center
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    //    simpleQueue_sync()
    //    simpleQueue_async()
    //    queuesWithQoS()
    //    concurrentQueues()
    //    queueWithDelay()
    useWorkItem()
  }
  
  func executeQueues() {
    if inactiveQueue != nil {
      inactiveQueue.activate()
    }
  }
  
  /*
   Part 1
   
   While the 2nd map() function is done on the main queue, and the DispatchQueue created
   runs on a background thread, because it's set to run synchronously we don't get to 
   the second map until the first finishes
   */
  func simpleQueue_sync() {
    
    let queue: DispatchQueue = DispatchQueue(label: "com.cathoughts.simple_queue_sync")
    
    queue.sync {
      _ = (0...10).map{print("🔴 ", $0)}
    }
    _ = (100...110).map{print("Ⓜ️ ", $0)}
  }
  
  /*
   By contrast, if the execution is be performed asynchronously, then both maps() get
   called in around the same time
   */
  func simpleQueue_async() {
    
    let queue: DispatchQueue = DispatchQueue(label: "com.cathoughts.simple_queue_async")
    
    queue.async {
      for i in 1...10 {
        print("🔴 ", i)
      }
    }
//    _ = (100...110).map{print("Ⓜ️ ", $0)}
    
    for i in 1...10 {
      print("Ⓜ️ ", i)
    }
  }
  
/*
 Part 2: QoS
 That information regarding the importance and priority of the tasks is called in GCD Quality of 
 Service (QoS). In truth, QoS is an enum with specific cases, and by providing the proper QoS 
 value upon the queue initialisation you specify the desired priority.
   
   userInteractive > userInitiated > default > utility > background > unspecified
 */
  
  func queuesWithQoS() {
    let queue1 = DispatchQueue(label: "com.catthoughts.queue1", qos: .userInitiated)
    let queue2 = DispatchQueue(label: "com.catthoughts.queue2", qos: .utility)
    
    queue1.async {
      for i in 1...10 {
        print("🔴 ", i)
      }
    }
    
    queue2.async {
      for i in 1...10 {
        print("Ⓜ️ ", i)
      }
    }
    
    for i in 1000...1010 {
      print("🔶 ", i)
    }
  }
  
  /*
   Part 3: Concurrent Queues
   
 */
  
  func concurrentQueues() {
    // By default, the queue is serial. You must specifically set it to concurrent
//    let queue = DispatchQueue(label: "com.catthoughts.queue_1", qos: .utility)
//    let queue = DispatchQueue(label: "com.catthoughts.queue_1", qos: .utility, attributes: .concurrent)
    
    // It is also possible to set a queue to be initially inactive, and then to later activate its tasks
//    let queue = DispatchQueue(label: "com.catthoughts.queue_1", qos: .utility, attributes: .initiallyInactive)
    
    // Not only that, but it is possible to be initially inactive and concurrent
    let queue = DispatchQueue(label: "com.catthoughts.queue_1", qos: .utility, attributes: [.initiallyInactive, .concurrent])
    self.inactiveQueue = queue
    queue.async {
      for i in 1...10 {
        print("🔴 ", i)
      }
    }
    
    queue.async {
      for i in 1...10 {
        print("Ⓜ️ ", i)
      }
    }
    
    queue.async {
      for i in 1000...1010 {
        print("🔶 ", i)
      }
    }
  }
  
  /*
   Part 4: Queues with Delay
   */
  func queueWithDelay() {
    let delayQueue = DispatchQueue(label: "com.catthoughts.delay", qos: .userInitiated)
    print(Date())
    let additionalTime: DispatchTimeInterval = .seconds(2)
    
    delayQueue.asyncAfter(deadline: .now() + additionalTime) {
      print(Date())
    }
  }
  
  /*
   Part 6: Dispatch Work Items
   (part 5 was using main to push ui updates following a network call, meh)
   */
  
  func useWorkItem() {
    var value = 10
    let workItem = DispatchWorkItem {
      value += 5
    }
    
    let queue = DispatchQueue.global()
//    queue.async {
//      workItem.perform()
//    }
    
    // also works like:
    queue.async(execute: workItem)
    
    // with work items, you can also notify the main queue
    workItem.notify(queue: DispatchQueue.main) { 
      print("value =", value)
    }
  }
}

