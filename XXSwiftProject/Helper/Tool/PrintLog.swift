//
//  PrintLog.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/3/31.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import Foundation

func PrintLog(_ item: Any?, file: String = #file, function: String = #function, line: Int = #line) {
    print("----- print log start -----")
    print("| 打印：", item ?? "")
    print("| 文件名：", file)
    print("| 函数：", function)
    print("| 行数：", line)
    print("----- print log end -----")
}
