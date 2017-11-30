//
//  MessageViewController.swift
//  UserProfileDemo
//
//  Created by Rick on 2017/11/28.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "消息"

        self.tabBarController?.tabBar.isTranslucent = false
   
    }

}
