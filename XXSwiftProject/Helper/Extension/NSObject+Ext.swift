//
//  NSObject+Ext.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/2/6.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

extension NSObject {
    func swiftClassFromString(className: String) -> UIViewController! {
        //将控制名转换为类
        let classType = NSClassFromString(className) as? UIViewController.Type
        if let type = classType {
            let newVC = type.init()
            return newVC
        }
        return nil;
    }
}
