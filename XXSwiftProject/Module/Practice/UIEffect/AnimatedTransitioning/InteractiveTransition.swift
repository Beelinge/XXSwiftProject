//
//  InteractiveTransition.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/6/14.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class InteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    enum InteractiveTransitionDirection {
        case Left
        case Right
        case Up
        case Down
    }
    
    enum InteractiveTransitionType {
        case Present
        case Dismiss
        case Push
        case Pop
    }
    
    var vc = UIViewController()
    var interation = false
    var direction: InteractiveTransitionDirection?
    var type: InteractiveTransitionType?
    
    var presentClosure: (() -> Void)?
    var pushClosure: (() -> Void)?
    
    init(type: InteractiveTransitionType, direction: InteractiveTransitionDirection) {
        self.type = type
        self.direction = direction
    }
    
    //通过这个方法给控制器的View添加相应的手势
    func addPanGestureForViewController(viewController: UIViewController) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(panGesture:)))
        vc = viewController
        viewController.view.addGestureRecognizer(pan)
    }
    
    //关键的手势过渡的过程
    @objc func handleGesture(panGesture: UIPanGestureRecognizer) {
        //手势百分比
        var persent: CGFloat = 0
        
        switch direction {
        case .Left?:
            let transitionX = -panGesture.translation(in: panGesture.view).x
            persent = transitionX / (panGesture.view?.frame.size.width)!
        case .Right?:
            let transitionX = panGesture.translation(in: panGesture.view).x
            persent = transitionX / (panGesture.view?.frame.size.width)!
        case .Up?:
            let transitionY = -panGesture.translation(in: panGesture.view).y
            persent = transitionY / (panGesture.view?.frame.size.width)!
        case .Down?:
            let transitionY = panGesture.translation(in: panGesture.view).y
            persent = transitionY / (panGesture.view?.frame.size.width)!
        default:
            break
        }
        switch panGesture.state {
        case .began:
            //手势开始的时候标记手势状态，并开始相应的事件，它的作用在使用这个类的时候说明
            interation = true
            //手势开始是触发对应的转场操作，方法代码在后面
            startGesture()
        case .changed:
            self.update(persent)
        case .ended:
            //手势完成后结束标记并且判断移动距离是否过半，过则finishInteractiveTransition完成转场操作，否者取消转场操作，转场失败
            interation = false
            if persent > 0.5 {
                self.finish()
            } else {
                self.cancel()
            }
        default:
            break
        }
    }
    
    //触发对应转场操作的代码如下，根据type(type是我自定义的枚举值)我们去判断是触发哪种操作
    //对于push和present由于要传入需要push和present的控制器，为了解耦，我用block把这个操作交个控制器去做了，让这个手势过渡管理者可以充分被复用
    func startGesture() {
        switch type {
        case .Present?:
            presentClosure?()
        case .Dismiss?:
            vc.dismiss(animated: true, completion: nil)
        case .Push?:
            pushClosure?()
        case .Pop?:
            vc.navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
}
