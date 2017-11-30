//
//  EditDataViewController.swift
//  UserProfileDemo
//
//  Created by Rick on 2017/11/30.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import SnapKit

class EditDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {

        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    let tableView = UITableView()
    var nameArr = ["头像", "昵称", "签名"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "编辑资料"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.isUserInteractionEnabled = true
        
        self.tableView.showsVerticalScrollIndicator = false
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EditDataCell")
        
        
        
        // // MARK: - 底部分割线对齐
        self.tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 40, bottom: 0, right: 0)
        self.tableView.layoutMargins = UIEdgeInsets.init(top: 0, left: 40, bottom: 0, right: 0)
        self.tableView.cellLayoutMarginsFollowReadableWidth = false
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
        let navgationBackgroundLabel = UILabel()
        navgationBackgroundLabel.backgroundColor = #colorLiteral(red: 0.03070729226, green: 0.03741941601, blue: 0.013447267, alpha: 1)
        self.view.addSubview(navgationBackgroundLabel)
        navgationBackgroundLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
        
        self.view.addSubview(navgationBackgroundLabel)
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditDataCell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = nameArr[indexPath.row]
        
        
        return cell

    }
    
    
}





