//
//  TestRxKeyboardController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/1/30.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import UIKit
import RxKeyboard
import RxSwift
import SnapKit

class VendorRxKeyboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var didSetupViewConstraints = false
    private let disposeBag = DisposeBag()

    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.keyboardDismissMode = .interactive
        t.frame = view.bounds
        return t
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        RxKeyboard.instance.visibleHeight
            .drive(onNext: {[weak self] keyboardVisibleHeight in
                self?.tableView.contentInset.bottom = keyboardVisibleHeight
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 15
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
            let tf = UITextField()
            tf.frame = CGRect(x: 100, y: 0, width: 200, height: 44)
//            tf.frame = (cell?.bounds)!
            cell?.addSubview(tf)
        }
        cell?.textLabel?.text = String(indexPath.row)
        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
