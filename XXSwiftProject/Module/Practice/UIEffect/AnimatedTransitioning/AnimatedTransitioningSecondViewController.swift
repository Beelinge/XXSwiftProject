//
//  AnimatedTransitioningSecondViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/6/8.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

protocol AnimatedTransitioningSecondViewControllerDelegate: AnyObject{
    var interactiveTransitionForPresent: InteractiveTransition {get set}
}

class AnimatedTransitioningSecondViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var delegate: AnimatedTransitioningSecondViewControllerDelegate?
    
    var interactiveDismiss: InteractiveTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         view.backgroundColor = UIColor.orange
        
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
        
        self.interactiveDismiss = InteractiveTransition.init(type: .Dismiss, direction: .Down)
        self.interactiveDismiss.addPanGestureForViewController(viewController: self)
        
    }
   
}

extension AnimatedTransitioningSecondViewController {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = AnimatedTransitioning_1()
        animation.type = .AnimatedTransitioningTypePresent
        return animation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = AnimatedTransitioning_1()
        animation.type = .AnimatedTransitioningTypeDismiss
        return animation
    }
    
    // 手势代理
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let interactivePresent = delegate?.interactiveTransitionForPresent else { return nil}
        return interactivePresent.interation ? interactivePresent : nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveDismiss.interation ? interactiveDismiss : nil
    }
    
}
