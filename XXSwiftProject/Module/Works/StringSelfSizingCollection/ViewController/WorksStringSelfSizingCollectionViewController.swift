
//
//  WorksStringSelfSizingCollectionViewController.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/2.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import Foundation
import UIKit

class WorksStringSelfSizingCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: self.layout)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        // 1.设置 最小行间距
        layout.minimumLineSpacing = 20
        // 2.设置 最小列间距
        layout.minimumInteritemSpacing  = 10
        // 3.设置item块的大小 (可以用于自适应)
        layout.estimatedItemSize = CGSize(width: 100, height: 10.0)
        // 设置滑动的方向 (默认是竖着滑动的)
        layout.scrollDirection =  UICollectionViewScrollDirection.vertical
        // 设置item的内边距
        layout.sectionInset = UIEdgeInsetsMake(10,10,10,10)
        return layout
    }()
    
    lazy var dataSource = ["1", "1234", "asdfafasdfasdfassdfasdfasdfasfsdfasdfasdfasfdfasf", "1234", "1234", "i5uui5ui", "1234", "1234", "1ryjrt234", "123dghdgh4", "1234", "1234", "1234", "1234", "a", "fadfadfadfadf", "afd", "a", "afasdf", "adf", "12trhrjtu34"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.register(WorksStringSelfSizingCollectionCell.classForCoder(), forCellWithReuseIdentifier: "SelfSizingCollectCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WorksStringSelfSizingCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelfSizingCollectCell", for: indexPath) as! WorksStringSelfSizingCollectionCell
        cell.textLabel.text = dataSource[indexPath.row]
        return cell
    }
}
