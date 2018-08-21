//
//  NipponTableViewController.swift
//  Demo
//
//  Created by Octree on 2018/8/21.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit
import ThemeKit

struct Nippon {
    
    var hex: String
    var name: String
    var nameEN: String
}

class NipponTableViewController: UITableViewController {

    lazy var colors: [Nippon] = {
        
        let path = Bundle.main.path(forResource: "nippon_colors", ofType: "txt")!
        let text = try! String(contentsOfFile: path)
        let lines = text.split(separator: "\n")
        return lines.map {
            line in
            let arr = line.split(separator: " ")
            return Nippon(hex: String(arr[0]), name: String(arr[1]), nameEN: String(arr[2]))
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.tk.backgroundColor = \Theme.background.primary
        tableView.tk.backgroundColor = \Theme.background.primary
        tableView.tk.separatorColor = \Theme.border.primary
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NipponTableViewCell", for: indexPath) as! NipponTableViewCell
        
        let nippon = colors[indexPath.row]
        cell.colorView.backgroundColor = UIColor(hexString: nippon.hex)
        cell.nameLabel.text = "\(nippon.name) \(nippon.nameEN)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nippon = colors[indexPath.row]
        ThemeManager.shared.changeTheme(with: UIColor(hexString: nippon.hex)!, style: ThemeManager.shared.style)
    }

}
