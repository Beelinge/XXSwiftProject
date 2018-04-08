//
//  VendorRxSwiftViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/2/6.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class VendorRxSwiftViewController: UIViewController {
    lazy var textField: UITextField = {
        let tf = UITextField()
        
        return tf
    }()
    
    var p = Person3()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let btn:UIButton = UIButton(type: .contactAdd)
        btn.frame = CGRect(x: 0, y: 300, width: 100, height: 100)
        view.addSubview(btn)
    
    
        btn.rx.controlEvent(.touchUpInside).subscribe() {
            print("touch me")
        }.dispose()
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer()
        tap.rx.event.subscribe(){
            
        }.dispose()
        
        let text = textField.rx.text.orEmpty.asObservable()
        
        Observable<Any>.create { (observer) -> Disposable in
            observer.onNext(0)
            observer.onNext(1)
            observer.onCompleted()
            return Disposables.create()
        }
        
        kvoTest()
        notificationTest()
    }
    
    // MARK: - notification test
    // 不需要去管理观察者的生命周期
    func notificationTest() {
//        NotificationCenter.default.rx
//            .notification(.UIApplicationWillEnterForeground)
//            .subscribe(onNext: { (notification) in
//                PrintLog("notification test")
//            }).disposed(by: disposeBag)
//
//        NotificationCenter.default.rx.notification(Notification.Name(rawValue: "j"), object: nil).takeLast(1).subscribe(onNext: { (noti) in
//            if let value = noti.userInfo!["value"] {
//                print("\(value)")
//            }
//        }).disposed(by: disposeBag)
//
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "j"), object: nil, userInfo:  ["value": 1])
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "j"), object: nil)
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "j"), object: nil)
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "j"), object: nil, userInfo:  ["value": 4])

 
    }
   
    // MARK: - KVO
    // rx.observe只能作用于NSObject子类的class类型，而不能作用于struct和enum
    func kvoTest() {
        
        p.name = "beelin1"
        
//        p.rx.observe(String.self, "name").subscribe(onNext: { (value) in
//            PrintLog(value)
//        }).disposed(by: disposeBag)
        
//        p.nameSubject.asObservable().subscribe(onNext: { value in
//             PrintLog(value)
//        }).dispose(by: disposeBag)
        
        p.nameVariable.asObservable().subscribe(onNext: { (value) in
            PrintLog(value)
        }).disposed(by: disposeBag)
        
        p.name = "beelin"
    }
}

class Person1: NSObject {
    var name: String = ""
}

// 使用PublishSubject
struct Person2 {
    var name: String = "" {
        didSet {
            nameSubject.onNext(name)
        }
    }
    var nameSubject = PublishSubject<String>()
}

// 使用Variable
struct Person3 {
    var name: String {
        get {
            return nameVariable.value
        }
        set {
            nameVariable.value = newValue
        }
    }
    var nameVariable = Variable<String>("")
}

