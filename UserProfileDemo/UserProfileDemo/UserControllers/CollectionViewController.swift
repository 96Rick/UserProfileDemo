//
//  CollectionViewController.swift
//  UserProfileDemo
//
//  Created by Rick on 2017/11/29.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit


class CollectionViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = false

        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "我的收藏"
        setupUI()
  
    }
    
    func setupUI() {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = "去收藏点东西吧"
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.center.equalToSuperview()
            make.height.equalTo(100)
        }
        
        let navgationBackgroundLabel = UILabel()
        navgationBackgroundLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.view.addSubview(navgationBackgroundLabel)
        navgationBackgroundLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.navigationController!.navigationBar.frame.height + 20)
        }
        
    }
   
}
