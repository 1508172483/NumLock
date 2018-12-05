//
//  NumLockCollectionViewCell.swift
//  NumLock
//
//  Created by 王江 on 2018/12/4.
//  Copyright © 2018年 ShopNC. All rights reserved.
//

import UIKit

class NumLockCollectionViewCell: UICollectionViewCell {
    var btn :UIButton!
    var numberLabel : UILabel!
    var lettersLabel : UILabel!
    
    func createView(number:String,letters:String){
        btn = UIButton()
        btn.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.2)
        self.contentView.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 62 * KSCALE / 2
        }
        numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.backgroundColor = UIColor.clear
        numberLabel.font = UIFont.systemFont(ofSize: 30)
        numberLabel.textAlignment = .center
        numberLabel.textColor = UIColor.white
        self.contentView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(13)
            make.height.equalTo(23)
        }
        if letters != "" {
            lettersLabel = UILabel()
            lettersLabel.text = letters
            lettersLabel.backgroundColor = UIColor.clear
            lettersLabel.font = UIFont.systemFont(ofSize: 10)
            lettersLabel.textAlignment = .center
            lettersLabel.textColor = UIColor.white
            self.contentView.addSubview(lettersLabel)
            lettersLabel.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo(numberLabel.snp.bottom).offset(5)
                make.height.equalTo(10)
            }
        }
    }
}
