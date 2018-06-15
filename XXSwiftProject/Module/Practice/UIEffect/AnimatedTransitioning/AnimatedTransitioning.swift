//
//  AnimatedTransitioning_1.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/6/14.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class AnimatedTransitioning_1: NSObject, UIViewControllerAnimatedTransitioning {
    enum AnimatedTransitioningType {
        case AnimatedTransitioningTypePresent
        case AnimatedTransitioningTypeDismiss
    }
    
    var type: AnimatedTransitioningType?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch type {
        case .AnimatedTransitioningTypePresent?:
            return presentAnimation(transitionContext: transitionContext)
        case .AnimatedTransitioningTypeDismiss?:
            return dismissAnimation(transitionContext: transitionContext)
        default:
            break
        }
    }
    
    func presentAnimation(transitionContext: UIViewControllerContextTransitioning?) {
        guard let transitionContext = transitionContext else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        guard let tempView = fromVC.view.snapshotView(afterScreenUpdates: false) else {
            return
        }
        
        tempView.frame = fromVC.view.frame
        fromVC.view.isHidden = true
        
        //这里有个重要的概念containerView，如果要对视图做转场动画，视图就必须要加入containerView中才能进行，可以理解containerView管理着所有做转场动画的视图
        let containerView = transitionContext.containerView
        containerView.addSubview(tempView)
        containerView.addSubview(toVC.view)
        
        toVC.view.frame = CGRect(x: 0, y: containerView.frame.height, width: containerView.frame.width, height: 400)
        
        //开始动画吧，使用产生弹簧效果的动画
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 1/0.55, options: UIViewAnimationOptions(rawValue: 0), animations: {
            toVC.view.transform = CGAffineTransform(translationX: 0, y: -400)
            tempView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        }) { (finished) in
            //使用如下代码标记整个转场过程是否正常完成[transitionContext transitionWasCancelled]代表手势是否取消了，如果取消了就传NO表示转场失败，反之亦然，如果不用手势present的话直接传YES也是可以的，但是无论如何我们都必须标记转场的状态，系统才知道处理转场后的操作，否者认为你一直还在转场中，会出现无法交互的情况，切记！
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
            //转场失败后的处理
            if transitionContext.transitionWasCancelled {
                //失败后，我们要把vc1显示出来
                fromVC.view.isHidden = false
                //然后移除截图视图，因为下次触发present会重新截图
                tempView.removeFromSuperview()
            }
        }
    }
    
    func dismissAnimation(transitionContext: UIViewControllerContextTransitioning?) {
        guard let transitionContext = transitionContext else {
            return
        }
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        //参照present动画的逻辑，present成功后，containerView的最后一个子视图就是截图视图，我们将其取出准备动画
        let tempView: UIView = transitionContext.containerView.subviews[0]
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            fromVC.view.transform = CGAffineTransform.identity
            tempView.transform = CGAffineTransform.identity
        }) { (finish) in
            if transitionContext.transitionWasCancelled {
                // 失败了标记失败
                transitionContext.completeTransition(false)
            } else {
                transitionContext.completeTransition(true)
                toVC.view.isHidden = false
                tempView.removeFromSuperview()
            }
        }
    }
}
