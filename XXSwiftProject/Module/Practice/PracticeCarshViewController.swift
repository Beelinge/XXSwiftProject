//
//  PracticeCarshViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/16.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit
import CrashEye

class PracticeCarshViewController: UIViewController ,CrashEyeDelegate {
    func crashEyeDidCatchCrash(with model: CrashModel) {
        print(model)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        CrashEye.add(delegate: self)
        
        
        let arr = NSArray()
        print(arr[10])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
