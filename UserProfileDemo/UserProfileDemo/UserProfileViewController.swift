//
//  UserProfileViewController.swift
//  UserProfileDemo
//
//  Created by Rick on 2017/11/28.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import SnapKit


class UserProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
 
   
    var tableView: UITableView!
    let cellID = "UserProfileCell"
    let topViewHeight: CGFloat = 260
    var topView: UIImageView!
    
    var cellNames = [0: ["我的收藏", "我的发布", "编辑资料"],
                     1: ["通用设置"]
    ]
    var cellImages = [0: ["收藏", "发布", "编辑"],
                      1: ["设置"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupUI()
        
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.black
        
        self.tableView = UITableView(frame: self.view.frame, style: .grouped)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isUserInteractionEnabled = true
        
        self.tableView.showsVerticalScrollIndicator = false
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        self.tableView.layer.borderWidth = 1
        self.tableView.layer.borderColor = UIColor.black.cgColor
        self.tableView.layer.cornerRadius = 4
        self.tableView.layer.masksToBounds = true
        
        // // MARK: - 底部分割线对齐
        self.tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0)
        self.tableView.layoutMargins = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0)
        self.tableView.cellLayoutMarginsFollowReadableWidth = false
        
        //MARK: - headImageView
        
        self.tableView.contentInset = UIEdgeInsetsMake(topViewHeight, 0, 0, 0)
        self.topView = UIImageView(image: UIImage(named: "1"))
        self.topView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: topViewHeight)
        self.topView.contentMode = .scaleAspectFill
        self.topView.clipsToBounds = true
        
        // MARK: - 毛玻璃
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        self.topView.addSubview(blurView)
        
        // MARK: - 用户头像 & 昵称
        let userHeadPortrait = UIButton(type: .custom)
        self.topView.addSubview(userHeadPortrait)
        userHeadPortrait.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalTo(topView)
            make.top.equalTo(50)
            
        }
        userHeadPortrait.setImage(UIImage(named: "headPortrait"), for: .normal)
        userHeadPortrait.layer.masksToBounds = true
        userHeadPortrait.layer.borderWidth = 4
        userHeadPortrait.layer.borderColor = UIColor.white.cgColor
        userHeadPortrait.layer.cornerRadius = 50
        
        let nameLabel = UILabel()
        nameLabel.text = "Rick"
        nameLabel.font = UIFont.systemFont(ofSize: 25)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        topView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(145)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
            
            make.height.equalTo(50)
        }
        
        let moodLabel = UILabel()
        moodLabel.textAlignment = .center
        moodLabel.textColor = .white
        moodLabel.text = "这是一条个性签名\n可以显示两行"
        moodLabel.font = UIFont.systemFont(ofSize: 13)
        moodLabel.numberOfLines = 2
        topView.addSubview(moodLabel)
        moodLabel.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(nameLabel.snp_bottom)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            
        }
        
        
        //MARK: - labelView & 积分、发帖、站龄
        let labelView = UIView()
//        labelView.backgroundColor = UIColor.blue
        self.topView.addSubview(labelView)
        labelView.snp.makeConstraints { (make) in
            make.height.equalTo(50)
           
            make.left.equalTo(0)
            make.top.equalTo(270)
            make.bottom.greaterThanOrEqualTo(0)
            make.right.equalTo(0)
        }
       
        
        
        let pointLabel = UILabel()
        pointLabel.font = UIFont.systemFont(ofSize: 15)
        pointLabel.numberOfLines = 1
        pointLabel.text = "积分 "
        pointLabel.textColor = UIColor.white
//        pointLabel.backgroundColor = UIColor.blue
        pointLabel.textAlignment = .center
        labelView.addSubview(pointLabel)
        pointLabel.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width / 3)
            make.left.equalTo(0)
            make.bottom.equalTo(15)
            make.top.equalTo(10)
            
        }
        let pointNum = UILabel()
        pointNum.text = "123"
        pointNum.font = UIFont.boldSystemFont(ofSize: 20)
        pointNum.textColor = UIColor.white
//        point.backgroundColor = UIColor.black
        pointNum.textAlignment = .center
        labelView.addSubview(pointNum)
        pointNum.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width / 3)
            make.height.equalTo(30)
            make.left.equalTo(0)
            make.top.equalTo(-10)
            
        }
        
        let postLabel = UILabel()
        postLabel.text = "发帖"
        postLabel.textAlignment = .center
        postLabel.textColor = .white
        postLabel.font = UIFont.systemFont(ofSize: 15)
        labelView.addSubview(postLabel)
        postLabel.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width / 3)
            make.left.equalTo(UIScreen.main.bounds.width / 3)
            make.bottom.equalTo(15)
            make.top.equalTo(10)
            
        }
        
        let postNum = UILabel()
        postNum.text = "456"
        postNum.textAlignment = .center
        postNum.textColor = .white
        postNum.font = UIFont.boldSystemFont(ofSize: 20)
        labelView.addSubview(postNum)
        postNum.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width / 3)
            make.left.equalTo(UIScreen.main.bounds.width / 3)
            make.height.equalTo(30)
            make.top.equalTo(-10)
            
        }
        
        
        let daysLabel = UILabel()
        daysLabel.text = "站龄"
        daysLabel.textAlignment = .center
        daysLabel.textColor = .white
        daysLabel.font = UIFont.systemFont(ofSize: 15)
        labelView.addSubview(daysLabel)
        daysLabel.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width / 3)
            make.left.equalTo(UIScreen.main.bounds.width / 3 * 2)
            make.bottom.equalTo(15)
            make.top.equalTo(10)
            
        }
        
        let daysNum = UILabel()
        daysNum.text = "789"
        daysNum.textAlignment = .center
        daysNum.textColor = .white
        daysNum.font = UIFont.boldSystemFont(ofSize: 20)
        labelView.addSubview(daysNum)
        daysNum.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.width / 3)
            make.left.equalTo(UIScreen.main.bounds.width / 3 * 2)
            make.height.equalTo(30)
            make.top.equalTo(-10)
            
            
        }
       
        
        let 分隔符 = UILabel()
        分隔符.text = "|"
        分隔符.font = UIFont.systemFont(ofSize: 60)
        分隔符.textAlignment = .center
        分隔符.textColor = UIColor.white
        分隔符.numberOfLines = 0
        labelView.addSubview(分隔符)
        分隔符.snp.makeConstraints { (make) in
            make.width.equalTo(5)
            make.height.equalTo(70)
            make.left.equalTo(UIScreen.main.bounds.width / 3 - 2.5)
            make.top.lessThanOrEqualTo(-20)
            make.bottom.greaterThanOrEqualTo(0)
            
        }
        
        let 分隔符1 = UILabel()
        分隔符1.text = "|"
        分隔符1.font = UIFont.systemFont(ofSize: 60)
        分隔符1.textAlignment = .center
        分隔符1.textColor = UIColor.white
        分隔符1.numberOfLines = 0
        labelView.addSubview(分隔符1)
        分隔符1.snp.makeConstraints { (make) in
            make.width.equalTo(5)
            make.height.equalTo(70)
            make.left.equalTo(UIScreen.main.bounds.width / 3 * 2 - 2.5)
            make.top.lessThanOrEqualTo(-20)
            make.bottom.greaterThanOrEqualTo(0)
            
        }
        
        self.tableView.addSubview(topView)
        self.view.addSubview(tableView)
    }
    
    // MARK: - 监听事件
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY: CGFloat = scrollView.contentOffset.y
        print(offsetY)
        if offsetY < -topViewHeight {
            topView.frame.origin.y = offsetY
            topView.frame.size.height = -offsetY
            
        }

    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.1
        default:
            return 20
        }
    }
    
    // MARK: - tableviewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNames[section]!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellNames.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let TextDataInSection = cellNames[indexPath.section]
        let ImageDataInSection = cellImages[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
    
        cell.textLabel?.text = TextDataInSection![indexPath.row]
        cell.imageView?.image = UIImage(named: ImageDataInSection![indexPath.row])
        
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView!.layer.masksToBounds = true
        cell.imageView!.clipsToBounds = true
        
        // 素材问题 大小不一 == 绘制Pic

        if indexPath.section == 0 && indexPath.row == 0 {
            let cellImageSize = CGSize(width: 17,height: 15)
            UIGraphicsBeginImageContextWithOptions(cellImageSize, false, 0)
            cell.imageView?.image?.draw(in: CGRect.init(origin: CGPoint.init(x: -14, y: -13), size: CGSize(width: 45, height: 45)))
            cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return cell
        } else {
            
            let cellImageSize = CGSize(width: 17,height: 15)
            UIGraphicsBeginImageContextWithOptions(cellImageSize, false, 0)
            cell.imageView?.image?.draw(in: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: cellImageSize))
            cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    
        return cell
        
    }
    
    // MARK: - 点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let backItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            self.navigationController?.pushViewController(CollectionViewController(), animated: true)
            break
        case (0,1):
            self.navigationController?.pushViewController(PostMessageViewController(), animated: true)
            break
        case (0,2): break
        case (1,0): break
        default:
            return
        }
        
        
    }

}
