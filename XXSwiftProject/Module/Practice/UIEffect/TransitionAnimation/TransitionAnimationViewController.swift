//
//  TransitionAnimationViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/5/7.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class TransitionAnimationViewController: UITableViewController {

    var dataSource = [String]()
     var modalTransitionType = [UIModalTransitionStyle]()
    var animationType = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = ["系统自带-coverVertical",
        "系统自带-flipHorizontal",
        "系统自带-crossDissolve",
        "系统自带-partialCurl",
        "向上翻一页-pageCurl",
        "向下翻一页-pageUnCurl",
        "滴水效果-rippleEffect",
        "收缩效果-suckEffect",
        "立方体效果-cube",
        "上下翻转效果-oglFlip",
        ]
        
        modalTransitionType = [.coverVertical,
        .flipHorizontal,
        .crossDissolve,
        .partialCurl]
        
        animationType = ["","","","",
                      "pageCurl",
                      "pageUnCurl",
                      "rippleEffect",
                      "suckEffect",
                      "cube",
                      "oglFlip",
        ]
        
        /*
 转换类型
         type
         kCATransitionFade//淡出
         kCATransitionMoveIn//覆盖原图
         kCATransitionPush//推出
         kCATransitionReveal//底部显出来
         
         subtype
         kCATransitionFromRight
         kCATransitionFromLeft// 默认值
         kCATransitionFromTop
         kCATransitionFromBottom
         
         其他动画类型
         pageCurl   向上翻一页
         pageUnCurl 向下翻一页
         rippleEffect 滴水效果
         suckEffect 收缩效果，如一块布被抽走
         cube 立方体效果
         oglFlip 上下翻转效果
 */
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
        if indexPath.row < 4 {
            let c = TransitionAnimationNextPageViewController()
            c.modalTransitionStyle = modalTransitionType[indexPath.row]
            self.present(c, animated: true, completion: nil)
        } else {
            let animation = CATransition()
            animation.duration = 0.5
            //animation.timingFunction =
            animation.type = self.animationType[indexPath.row]
            animation.subtype = kCATransitionFromLeft
            self.view.window?.layer.add(animation, forKey: nil)
            
            let c = TransitionAnimationNextPageViewController()
            self.present(c, animated: true, completion: nil)
            
            // self.navigationController?.view.layer.add(animation, forKey: nil)
            // self.navigationController?.pushViewController(c, animated: true)
            
        }
        
        
    }
    
}
