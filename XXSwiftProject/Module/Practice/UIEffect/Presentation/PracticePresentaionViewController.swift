//
//  PracticePresentaionController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/19.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit
import RxSwift
class PracticePresentaionViewController: UIViewController {
    var btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        btn = UIButton(type: UIButtonType.contactAdd)
        btn.frame = CGRect(x: 100, y: 400, width: 30, height: 30)
        view.addSubview(btn)
        btn.rx.tap.subscribe(onNext: {[weak self] () in
            let vc = PresentationFirstViewController()
            vc.modalPresentationStyle = .custom
           vc.transitioningDelegate = self
            self?.present(vc, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    let disposeBag = DisposeBag()
}


extension PracticePresentaionViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let present = PresentaionCoordinator_2(presentedViewController: presented, presenting: presenting)
        present.source = source
        return present
    }
}
