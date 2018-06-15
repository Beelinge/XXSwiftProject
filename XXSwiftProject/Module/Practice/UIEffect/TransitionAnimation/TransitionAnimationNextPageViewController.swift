//
//  TransitionAnimationNextPageViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/5/7.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit
import RxSwift

class TransitionAnimationNextPageViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
        let btn = UIButton(type: UIButtonType.contactAdd)
        btn.frame = CGRect(x: 100, y: 100, width: 30, height: 30)
        view.addSubview(btn)
        btn.rx.tap.subscribe(onNext: {[weak self] () in
           self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
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
