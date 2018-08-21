//
//  NipponTableViewCell.swift
//  Demo
//
//  Created by Octree on 2018/8/21.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit
import ThemeKit

class NipponTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tk.backgroundColor = \Theme.background.scene
        nameLabel.tk.textColor = \Theme.text.primary
    }

}
