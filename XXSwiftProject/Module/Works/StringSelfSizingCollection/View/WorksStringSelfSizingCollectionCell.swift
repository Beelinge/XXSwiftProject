//
//  WorksStringSelfSizingCollectionCell.swift
//  XXSwiftProject
//
//  Created by Beelin on 2018/4/2.
//  Copyright © 2018年 Beelin. All rights reserved.
//

import Foundation
import UIKit

class WorksStringSelfSizingCollectionCell: UICollectionViewCell {
    let itemHeight:CGFloat = 30.0
    
    lazy var textLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.red
        
        contentView.addSubview(textLabel)
        
        textLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        
        var frame = rectWithFont(textLabel.text!)
        if frame.size.width >= UIScreen.main.bounds.width {
            frame.size.width = UIScreen.main.bounds.width * 0.6
        }
        frame.size.width += 20
        frame.size.height = itemHeight
        attributes.frame = frame
        
        return attributes
    }
    
    /**
     Get the width with the string.
     - parameter font: The font.
     - returns: The string's width.
     */
    func rectWithFont(_ text: String = "", font : UIFont = UIFont.systemFont(ofSize: 17)) -> CGRect {
        
        guard text.count > 0 else {
            return CGRect()
        }
        
        let size = CGSize(width: CGFloat(MAXFLOAT), height: itemHeight)
        let text = text as NSString
        return text.boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: font], context: nil)
    }
}
