//
//  PracticeViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/2/6.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class PracticeViewController: UITableViewController {
    
    
    fileprivate var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [NSStringFromClass(PracticeWKWebViewController.classForCoder()),
                      NSStringFromClass(PracticeStackViewController.classForCoder()),
                      NSStringFromClass(UIEffectViewController.classForCoder()),
                      NSStringFromClass(UIEffectViewController.classForCoder()),
                       NSStringFromClass(PracticeGCDViewController.classForCoder())
            
        ]
        
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        
        if cell == nil  {
            cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllerString = dataSource[indexPath.row]
        let c:UIViewController = swiftClassFromString(className: controllerString)
        self.navigationController?.pushViewController(c, animated: true)
    }
    
}
