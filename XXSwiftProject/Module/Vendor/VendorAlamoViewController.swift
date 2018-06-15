//
//  XXAlamoController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2017/12/29.
//  Copyright © 2017年 Beelin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class VendorAlamoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginAction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loginAction() {
        //POST request
        let postsEndpoint: String = "http://wx.2mashi.com/AgencyAPI/api/Manager/login"
        let newPost: Dictionary = ["app_account": "00000021_m", "app_password": "123456"]
        
        Alamofire.request(postsEndpoint, method: .post, parameters: newPost, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in

            switch(response.result) {
            case .success(let value):
                // let dict = response.result.value as! Dictionary<String,AnyObject>
                // let errcode = dict["errcode"] as! Int
                // print("response : \(dict)")
                
                // use to SwiftyJSON
                let json = JSON(value)
                let errcode = json["errcode"]
                if (errcode == 200 ) {
                    print("suucess")
                } else {
                    print("error")
                }
            case .failure(let error):
                print("Failure : \(error)")
            }
        }
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
