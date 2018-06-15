//
//  PracticeGCDViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/6/7.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class PracticeGCDViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        semaphore()
    }
    
    
}

// MARK: - DispatchWorkItem
extension PracticeGCDViewController {
    func workItem() {
        
        let workItem = DispatchWorkItem {
            sleep(5)
            PrintLog("workItem...")
        }
        DispatchQueue.global().async(execute: workItem)
        
        print("before waiting")
        workItem.wait()
        print("after waiting")
        
    }
    
    // barrier
    func workItemFlags() {
        let flags = DispatchWorkItem(qos: .default, flags: .barrier) {
            sleep(3)
            PrintLog("workItemFlags...")
        }
         DispatchQueue.global().async(execute: flags)
        
    }
}

// MARK: - DispatchSemaphore
extension PracticeGCDViewController {
    func semaphore() {
        let semaphore = DispatchSemaphore(value: 2)
        DispatchQueue.global().async {
            semaphore.wait()
            print("run task 1")
            sleep(1)
            print("complete task 1")
            semaphore.signal()
        }
        
        DispatchQueue.global().async {
            semaphore.wait()
            print("run task 2")
            sleep(1)
            print("complete task 2")
            semaphore.signal()
        }
        
        DispatchQueue.global().async {
            semaphore.wait()
            print("run task 3")
            sleep(1)
            print("complete task 3")
            semaphore.signal()
        }
    }
    /* 打印结果
     run task 1
     run task 2
     complete task 1
     complete task 2
     run task 3
     complete task 3
     */
}
