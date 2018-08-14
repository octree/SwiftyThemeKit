//
//  SonyTableViewCell.swift
//  Demo
//
//  Created by Octree on 2018/8/14.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

class SonyTableViewCell: UITableViewCell {

    @IBOutlet weak var sceneView: UIView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var modelLable: UILabel!
    @IBOutlet weak var lensLabel: UILabel!
    @IBOutlet weak var evLabel: UILabel!
    @IBOutlet weak var isoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
