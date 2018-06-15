//
//  AnimatedTransitioningViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/6/8.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit
import RxSwift

class AnimatedTransitioningViewController: UIViewController, AnimatedTransitioningSecondViewControllerDelegate {
    lazy var interactiveTransitionForPresent: InteractiveTransition = {
       return self.interactiveTransitionForPresent
    }()

    let disposeBag = DisposeBag()
    
    var interactivePresent: InteractiveTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let btn = UIButton(type: UIButtonType.contactAdd)
        btn.frame = CGRect(x: 100, y: 100, width: 30, height: 30)
        view.addSubview(btn)
        btn.rx.tap.subscribe(onNext: {[weak self] () in
            let vc = AnimatedTransitioningSecondViewController()
//            vc.modalPresentationStyle = .custom
//            vc.transitioningDelegate = self
            self?.present(vc, animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        self.interactivePresent = InteractiveTransition(type: .Present, direction: .Up)
        self.interactiveTransitionForPresent = interactivePresent
        self.interactivePresent.presentClosure = { [weak self] in
            let vc = AnimatedTransitioningSecondViewController()
            vc.delegate = self
            self?.present(vc, animated: true, completion: nil)
        }
    }
    
    // MARK: - AnimatedTransitioningSecondViewControllerDelegate
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
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
