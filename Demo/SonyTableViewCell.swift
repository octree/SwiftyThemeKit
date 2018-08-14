//
//  SonyTableViewCell.swift
//  Demo
//
//  Created by Octree on 2018/8/14.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit
import ThemeKit

class SonyTableViewCell: UITableViewCell {

    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var sceneView: UIView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var modelLable: UILabel!
    @IBOutlet weak var lensLabel: UILabel!
    @IBOutlet weak var evLabel: UILabel!
    @IBOutlet weak var isoLabel: UILabel!
    @IBOutlet var icons: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sceneView.layer.cornerRadius = 12
        sceneView.layer.masksToBounds = true
        
        contentView.tk.backgroundColor = \Theme.background.secondary
        sceneView.tk.backgroundColor = \Theme.background.scene
        
        modelLable.tk.textColor = \Theme.text.secondary
        lensLabel.tk.textColor = \Theme.text.tertiary
        evLabel.tk.textColor = \Theme.text.tertiary
        isoLabel.tk.textColor = \Theme.text.tertiary
        plateLabel.tk.textColor = \Theme.text.primary
        
        for icon in icons {
            
            icon.tk.tintColor = \Theme.base.positive
        }
    }
}
