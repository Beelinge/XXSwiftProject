//
//  BlurEffectViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/20.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit

class BlurEffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        let style = UIBlurEffectStyle.extraLight
        let effect = UIBlurEffect.init(style: style)
        let effectView = UIVisualEffectView.init(effect: effect)
        effectView.frame = view.bounds
        
        let imv = UIImageView()
        imv.frame = view.bounds
        imv.image = UIImage(named: "1.jpg")
        
        imv.addSubview(effectView)
        view.addSubview(imv)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
