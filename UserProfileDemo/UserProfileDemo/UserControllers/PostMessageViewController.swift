//
//  PostMessageViewController.swift
//  UserProfileDemo
//
//  Created by Rick on 2017/11/29.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit


class PostMessageViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
      self.navigationController?.setNavigationBarHidden(false, animated: true)
        let navgationBackgroundLabel = UILabel()
        navgationBackgroundLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.view.addSubview(navgationBackgroundLabel)
        navgationBackgroundLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(self.navigationController!.navigationBar.frame.height + 20)
        }
        
        self.view.addSubview(navgationBackgroundLabel)
    }
    
    var VCIDs : [String] = ["MyPostVC", "MyReplayVC"]
    var pageNames = ["我的主题", "我的回复"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的发布"
        setupUI()
    }

    func setupUI() {
    
        let swiftPagesView: SwiftPages!
        swiftPagesView = SwiftPages(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
    swiftPagesView.initializeWithVCIDsArrayAndButtonTitlesArray(VCIDsArray: VCIDs, buttonTitlesArray: pageNames)
        swiftPagesView.setButtonsTextFontAndSize(fontAndSize: UIFont.systemFont(ofSize: 15))
        swiftPagesView.enableAeroEffectInTopBar(boolValue: false)
        swiftPagesView.setButtonsTextColor(color: .white)
        swiftPagesView.setTopBarBackground(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        swiftPagesView.setAnimatedBarColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        swiftPagesView.setContainerViewBackground(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.view.addSubview(swiftPagesView)
    }
}
