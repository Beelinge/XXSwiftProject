//
//  VendorMoyaViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/6/8.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

class VendorMoyaViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
    }
    
    func request() {
        // 测试桩
        let provider = MoyaProvider<MoyaService>(stubClosure: MoyaProvider.immediatelyStub)
        
        provider.request(MoyaService.moyaTest) { (result) in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let json = JSON(data)
                print(json)
            case let .failure(error): break
                // TODO: handle the error == best. comment. ever.
            }
        }
    }
    
}


enum MoyaService: TargetType {
    case moyaTest
    
}

extension MoyaService {
    var baseURL: URL { return URL(string: "https://www.baidu.com")! }
    var path: String {
        switch self {
        case .moyaTest:
            return ""
        }
    }
    var method: Moya.Method {
        switch self {
        case .moyaTest:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .moyaTest: // Send no parameters
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .moyaTest:
            return """
                {
                "name": "beelin",
                "age": 18
                }
                """.data(using: .utf8)!
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
