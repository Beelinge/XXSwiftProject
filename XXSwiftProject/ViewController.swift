//
//  ViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2017/11/13.
//  Copyright © 2017年 Beelin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let lab = UILabel()
        lab.frame = self.view.bounds
        lab.text = "as"
        self.view.addSubview(lab)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

