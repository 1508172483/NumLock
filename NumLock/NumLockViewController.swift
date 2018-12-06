//
//  NumLockViewController.swift
//  NumLock
//
//  Created by 王江 on 2018/12/3.
//  Copyright © 2018年 ShopNC. All rights reserved.
//

import UIKit
import SnapKit
let KSCALE = UIScreen.main.bounds.size.width/375
class NumLockViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var pointView :UIView!
    var point1 :UIButton!
    var point2 :UIButton!
    var point3 :UIButton!
    var point4 :UIButton!
    var point5 :UIButton!
    var point6 :UIButton!
    var pointStr = ""
    
    let letterArr = ["","ABC","DEF","GHI","JKL","MNO","PQRS","TUV","WXYZ"]
    var chainCode = ""
    var ordersId = ""
    //
    var type :Int! = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 25/255, green: 28/255, blue: 35/255, alpha: 1.0)
        initHeader()
        initNumLockKeyboard()
        // Do any additional setup after loading the view.
    }
    @objc func backClicked(){
        self.navigationController?.popViewController(animated: true)
    }
    func initHeader(){
        let name = UILabel()
        name.text = "提货码"
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 39)
        name.sizeToFit()
        name.textColor = UIColor.white
        self.view.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(88)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        let content = UILabel()
        content.text = "输入提货/兑换码后显示对应类型订单"
        content.textAlignment = .center
        content.sizeToFit()
        content.textColor = UIColor.white
        content.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(content)
        content.snp.makeConstraints { (make) in
            make.top.equalTo(name.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        pointView = UIView()
        self.view.addSubview(pointView)
        pointView.snp.makeConstraints { (make) in
            make.top.equalTo(content.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(20)
        }
        point1 = UIButton()
        point1.setImage(UIImage.init(named: "circle"), for: .normal)
        point1.imageEdgeInsets = UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
        point1.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        point1.tag = 0
        pointView.addSubview(point1)
        point1.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.height.equalTo(20)
        }
        point2 = UIButton()
        point2.setImage(UIImage.init(named: "circle"), for: .normal)
        point2.imageEdgeInsets = UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
        point2.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        point2.tag = 1
        pointView.addSubview(point2)
        point2.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20*2)
            make.width.height.equalTo(20)
        }
        point3 = UIButton()
        point3.setImage(UIImage.init(named: "circle"), for: .normal)
        point3.imageEdgeInsets = UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
        point3.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        point3.tag = 2
        pointView.addSubview(point3)
        point3.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20*4)
            make.width.height.equalTo(20)
        }
        point4 = UIButton()
        point4.setImage(UIImage.init(named: "circle"), for: .normal)
        point4.imageEdgeInsets = UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
        point4.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        point4.tag = 3
        pointView.addSubview(point4)
        point4.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20*6)
            make.width.height.equalTo(20)
        }
        point5 = UIButton()
        point5.setImage(UIImage.init(named: "circle"), for: .normal)
        point5.imageEdgeInsets = UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
        point5.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        point5.tag = 4
        pointView.addSubview(point5)
        point5.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20*8)
            make.width.height.equalTo(20)
        }
        point6 = UIButton()
        point6.setImage(UIImage.init(named: "circle"), for: .normal)
        point6.imageEdgeInsets = UIEdgeInsets(top: 2.5, left: 2.5, bottom: 2.5, right: 2.5)
        point6.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        point6.tag = 5
        pointView.addSubview(point6)
        point6.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20*10)
            make.width.height.equalTo(20)
        }
    }
    func initNumLockKeyboard(){
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize(width: 62 * KSCALE, height: 62 * KSCALE)
        flowLayout.minimumLineSpacing = 20 * KSCALE
        flowLayout.sectionInset = UIEdgeInsets(top: 20 * KSCALE, left: 60 * KSCALE, bottom: 0, right: 60 * KSCALE)
        let collection = UICollectionView.init(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-200), collectionViewLayout: flowLayout)
        collection.register(NumLockCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "NumLockCollectionViewCell")
        collection.dataSource = self
        collection.backgroundColor = UIColor.init(red: 25/255, green: 28/255, blue: 35/255, alpha: 1.0)
        self.view.addSubview(collection)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumLockCollectionViewCell", for: indexPath) as? NumLockCollectionViewCell
        if indexPath.row < 9 {
            cell?.createView(number: "\(indexPath.row+1)", letters: letterArr[indexPath.row])
            cell?.btn.tag = indexPath.row + 1
            cell?.btn.addTarget(self, action: #selector(NumLockViewController.btnClicked(btn:)), for: .touchUpInside)
        }else if indexPath.row == 9 {
            cell?.createView(number: "", letters: "")
            cell?.btn.backgroundColor = UIColor.clear
            //这里可以加自己的按钮
            //清空
            let clearImage = UIImageView()
            clearImage.image = UIImage.init(named: "clean")
            cell?.contentView.addSubview(clearImage)
            clearImage.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(13)
                make.height.width.equalTo(23)
            }
            let clearLabel = UILabel()
            clearLabel.textColor = UIColor.white
            clearLabel.text = "清空"
            clearLabel.font = UIFont.systemFont(ofSize: 12)
            clearLabel.textAlignment = .center
            cell?.contentView.addSubview(clearLabel)
            clearLabel.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo(clearImage.snp.bottom).offset(5)
                make.height.equalTo(15)
            }
            cell?.btn.addTarget(self, action: #selector(NumLockViewController.cleanClicked), for: .touchUpInside)
        }else if indexPath.row == 10 {
            cell?.createView(number: "0", letters: "")
            cell?.btn.tag = 0
            cell?.btn.addTarget(self, action: #selector(NumLockViewController.btnClicked(btn:)), for: .touchUpInside)
        }else if indexPath.row == 11 {
            cell?.createView(number: "", letters: "")
            cell?.btn.backgroundColor = UIColor.clear
            //这里可以加自己的按钮
            //清空
            let clearImage = UIImageView()
            clearImage.image = UIImage.init(named: "delete")
            cell?.contentView.addSubview(clearImage)
            clearImage.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(13)
                make.height.width.equalTo(23)
            }
            let clearLabel = UILabel()
            clearLabel.textColor = UIColor.white
            clearLabel.text = "删除"
            clearLabel.font = UIFont.systemFont(ofSize: 12)
            clearLabel.textAlignment = .center
            cell?.contentView.addSubview(clearLabel)
            clearLabel.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo(clearImage.snp.bottom).offset(5)
                make.height.equalTo(15)
            }
            cell?.btn.addTarget(self, action: #selector(NumLockViewController.deleteClicked), for: .touchUpInside)
        }
        return cell!
    }
    @objc func btnClicked(btn:UIButton){
        pointStr.append("\(btn.tag)")
        if pointStr.count == 1 {
            point1.setImage(nil, for: .normal)
            point1.setTitle("\(btn.tag)", for: .normal)
        }else if pointStr.count == 2 {
            point2.setImage(nil, for: .normal)
            point2.setTitle("\(btn.tag)", for: .normal)
        }else if pointStr.count == 3 {
            point3.setImage(nil, for: .normal)
            point3.setTitle("\(btn.tag)", for: .normal)
        }else if pointStr.count == 4 {
            point4.setImage(nil, for: .normal)
            point4.setTitle("\(btn.tag)", for: .normal)
        }else if pointStr.count == 5 {
            point5.setImage(nil, for: .normal)
            point5.setTitle("\(btn.tag)", for: .normal)
        }else if pointStr.count == 6 {
            point6.setImage(nil, for: .normal)
            point6.setTitle("\(btn.tag)", for: .normal)
            //输入不对时抖动动画
            self.startShake()
            pointStr = ""
            changeBtnState()
        }
    }
    @objc func cleanClicked(){
        pointStr = ""
        changeBtnState()
    }
    @objc func deleteClicked(){
        if pointStr.count > 0 {
            pointStr = String(pointStr[pointStr.startIndex..<pointStr.index(pointStr.endIndex, offsetBy: -1)])
            print(pointStr,pointStr.count)
            changeBtnState()
        }
    }
    //根据字符串长度改变按钮状态
    func changeBtnState(){
        for item in pointView.subviews {
            let btn = item as? UIButton
            if item.tag >= pointStr.count && btn?.classForCoder == UIButton.classForCoder() {
                btn!.setImage(UIImage.init(named: "circle"), for: .normal)
                btn!.setTitle("", for: .normal)
            }
        }
    }
    //收入错误抖动动画
    func startShake(){
        let animation = CAKeyframeAnimation.init(keyPath: "transform.translation.x")
        let s = 10
        animation.values = [-s,0,s,0,-s,0]
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.isRemovedOnCompletion = true
        pointView.layer.add(animation, forKey: "shake")
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
