//
//  SonyViewController.swift
//  Demo
//
//  Created by Octree on 2018/8/14.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit
import ThemeKit

class SonyViewController: UIViewController  {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let headerview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        headerview.tk.backgroundColor = \Theme.background.secondary
        tableView.tableHeaderView = headerview
        
        view.tk.backgroundColor = \Theme.background.secondary
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tk.backgroundColor = \Theme.background.secondary
    }
    
}


extension SonyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SonyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SonyTableViewCell", for: indexPath) as! SonyTableViewCell
        let sony = SonyData[indexPath.row]
        cell.photoView.image = sony.photo
        cell.modelLable.text = sony.model
        cell.lensLabel.text = "CL：" + sony.lens
        cell.evLabel.text = "EV：" + sony.ev
        cell.isoLabel.text = "ISO：" + sony.iso
        
        return cell
    }
}
