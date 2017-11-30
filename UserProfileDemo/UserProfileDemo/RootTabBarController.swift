//
//  RootTabBarController.swift
//  UserProfileDemo
//
//  Created by Rick on 2017/11/28.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit


class RootTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createViewControllers()
        
    }
    
    func createViewControllers() {
        
        let homeNC = UINavigationController(rootViewController: HomeViewController())
        
        homeNC.tabBarItem.image = UIImage(named: "home")
        homeNC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        
        
        let discoverNC = UINavigationController(rootViewController: DiscoverViewController())
        discoverNC.tabBarItem.image = UIImage(named: "discover")
        discoverNC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        
        
        let messageNC = UINavigationController(rootViewController: MessageViewController())
        messageNC.tabBarItem.image = UIImage(named: "message")
        messageNC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        
        
        let userProfileNC = UINavigationController(rootViewController: UserProfileViewController())
        userProfileNC.tabBarItem.image = UIImage(named: "profile")
        userProfileNC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        
        
        let tabBarArr = [homeNC, discoverNC, messageNC, userProfileNC]
        
        self.viewControllers = tabBarArr
        self.tabBar.tintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        
        
        
    }
    
}
