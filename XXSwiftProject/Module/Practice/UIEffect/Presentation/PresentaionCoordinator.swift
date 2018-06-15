//
//  PresentaionCoordinator.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/19.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class PresentaionCoordinator: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
//        blackView.alpha = 0
        containerView?.addSubview(blackView)
        UIView.animate(withDuration: 0.25) {
//            self.blackView.alpha = 1
        }
    }
    
    override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.25) {
//            self.blackView.alpha = 0
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            blackView.removeFromSuperview()
        }
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: UIScreen.main.bounds.height - controllerHeight, width: UIScreen.main.bounds.width, height: controllerHeight)
    }
    
    let controllerHeight: CGFloat = 200.0
    
    // MARK: - Lazy
    lazy var blackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
//        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let style = UIBlurEffectStyle.extraLight
        let effect = UIBlurEffect.init(style: style)
        let effectView = UIVisualEffectView.init(effect: effect)
        effectView.frame = view.bounds
        view.addSubview(effectView)
        return view
    }()
}

class PresentaionCoordinator_2: UIPresentationController, CAAnimationDelegate {
    
    var source = UIViewController()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }
        containerView.addSubview(presentedViewController.view)
        
        let fromViewController = source as! PracticePresentaionViewController
        //画两个圆路径
        let startCycle = UIBezierPath.init(ovalIn: fromViewController.btn.frame)
        let width: CGFloat = containerView.frame.size.width
        let height: CGFloat = containerView.frame.size.height
        let x = max(fromViewController.btn.frame.origin.x, width - fromViewController.btn.frame.origin.x)
        let y = max(fromViewController.btn.frame.origin.y, height - fromViewController.btn.frame.origin.y)
        
        //勾股定理计算半径
        let radius = CGFloat(sqrtf(Float(pow(x, 2) + pow(y, 2))))
        
        //以按钮中心为圆心，按钮中心到屏幕边缘的最大距离为半径，得到转场后的path
        let endCycle = UIBezierPath.init(arcCenter: containerView.center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = endCycle.cgPath
        containerView.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.delegate = self
        maskLayerAnimation.fromValue = startCycle.cgPath
        maskLayerAnimation.toValue = endCycle.cgPath
        maskLayerAnimation.duration = 0.25
        
        maskLayer.add(maskLayerAnimation, forKey: "path")
        
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        
    }
    
    override func dismissalTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }
        containerView.addSubview(presentedViewController.view)
        
        let toViewController = source as! PracticePresentaionViewController

        //画两个圆路径
        let endCycle = UIBezierPath.init(ovalIn: toViewController.btn.frame)

        //勾股定理计算半径
        let radius = CGFloat(sqrtf(Float(containerView.frame.size.height * containerView.frame.size.height + containerView.frame.size.width * containerView.frame.size.width)) / 2)

        //以按钮中心为圆心，按钮中心到屏幕边缘的最大距离为半径，得到转场后的path
        let startCycle = UIBezierPath.init(arcCenter: containerView.center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)

        let maskLayer = CAShapeLayer()
        maskLayer.path = endCycle.cgPath
        containerView.layer.mask = maskLayer

        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.delegate = self
        maskLayerAnimation.fromValue = startCycle.cgPath
        maskLayerAnimation.toValue = endCycle.cgPath
        maskLayerAnimation.duration = 0.05

        maskLayer.add(maskLayerAnimation, forKey: "path")
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        
    }
    
}
