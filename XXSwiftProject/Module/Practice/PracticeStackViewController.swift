//
//  PracticeStackViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/16.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class PracticeStackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let s1 = UIStackView()
        s1.frame = CGRect(x: 50, y: 100, width: 300, height: 50)
        s1.backgroundColor = UIColor.green
        s1.spacing = 10
        s1.axis = .horizontal
        s1.alignment = .fill
        s1.distribution = .fill
        
        view.addSubview(s1)
        
        let lab1 = UILabel()
//        lab1.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        lab1.backgroundColor = UIColor.black
        s1.addArrangedSubview(lab1)
        
        let lab2 = UILabel()
        lab2.backgroundColor = UIColor.blue
//        lab2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        s1.addArrangedSubview(lab2)
        
        let s2 = UIStackView()
        s2.frame = CGRect(x: 50, y: 100, width: 50, height: 50)
        s2.backgroundColor = UIColor.red
        view.addSubview(s2)
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
