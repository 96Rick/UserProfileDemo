//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by Rick on 2017/11/26.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    
    var episodeListItems: [EpisodeListItem] = []
    
    func getEpisodeListItemData() {
        for i in 0..<10 {
            let e = EpisodeListItem()
            e.titiel = "Episode \(i)"
            e.finished = i % 2 == 0 ? true : false
            episodeListItems.append(e)
        }
    }
    
    func documentsDirectory() -> NSURL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0] as NSURL
    }
    
    func fileUrl(fileName: String) -> NSURL {
        let documentUrl = self.documentsDirectory().appendingPathComponent(fileName)
        return documentUrl! as NSURL
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEpisodeListItemData()
        
        let documentsDirUrl = documentsDirectory()
        let plistUrl = fileUrl(fileName: "EpisodeList.plist")
        print("Documents Dir Url: \(documentsDirUrl)")
        print("plist file Url: \(plistUrl)")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeItem", for: indexPath)
        
        let label = cell.viewWithTag(1024) as! UILabel
        
        let title = self.episodeListItems[indexPath.row].titiel
        label.text = title
        label.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        cell.accessoryType = self.episodeListItems[indexPath.row].finished ? .checkmark : .detailButton
        
        return cell
    }

}

