//
//  ViewController.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit
import SwiftyThemeKit

class ViewController: UIViewController {
    
    @IBOutlet var satButtons: [UIButton]!
    @IBOutlet var colorButtons: [UIButton]!
    
    var primaryColor: UIColor {
        
        return ThemeManager.shared.primaryColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderButtons()
        bindTheme()
        updateSatButtons()
    }
    
    func bindTheme() {
        
        
        navigationController?.navigationBar.tk.barTintColor = \Theme.background.bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tk.tintColor = \Theme.base.positive
        navigationController?.navigationBar.tk.titleColor = \Theme.text.primary
        view.tk.backgroundColor = \Theme.background.primary
    }
    
    func renderButtons() {
        
        for (index,button) in colorButtons.enumerated() {
            button.tag = index
            button.backgroundColor = UIColor(hex6: ThemePrimaryColors[index])
        }
    }
    
    func updateSatButtons() {
        
        let colors = self.primaryColor.suggestColors
        for (index, button) in satButtons.enumerated() {
            button.backgroundColor = colors[index]
        }
    }
    
    @IBAction func satButtonTapped(_ sender: UIButton) {
        
        ThemeManager.shared.changeTheme(with: sender.backgroundColor!, style: ThemeManager.shared.style)
    }
    
    @IBAction func selectColor(_ sender: UIButton) {
        
        ThemeManager.shared.changeTheme(with: sender.backgroundColor!, style: ThemeManager.shared.style)
        updateSatButtons()
    }
    
    @IBAction func selectLight(_ sender: UIButton) {
        
        let color = ThemeManager.shared.primaryColor
        ThemeManager.shared.changeTheme(with: color, style: .light)
    }
    @IBAction func selectDark(_ sender: UIButton) {
        
        let color = ThemeManager.shared.primaryColor
        ThemeManager.shared.changeTheme(with: color, style: .dark)
    }
    
    @IBAction func selectNight(_ sender: UIButton) {
        
        let color = ThemeManager.shared.primaryColor
        ThemeManager.shared.changeTheme(with: color, style: .night)
    }
}


