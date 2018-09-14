//
//  ViewController.swift
//  ThemeKit
//
//  Created by Octree on 2018/8/13.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit
import ThemeKit

class ViewController: UIViewController {
    
    @IBOutlet var satButtons: [UIButton]!
    
    
    @IBOutlet weak var primaryBg: UIView!
    @IBOutlet weak var secondaryBg: UIView!
    @IBOutlet weak var positiveBg: UIView!
    
    @IBOutlet var colorButtons: [UIButton]!
    
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    @IBOutlet weak var lb3: UILabel!
    @IBOutlet weak var lbOver: UILabel!
    @IBOutlet weak var positiveButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var primaryColor = UIColor(hex6: ThemePrimaryColors[0])
    var style = ThemeManager.Style.light
    var color = UIColor(hex6: ThemePrimaryColors[0])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderButtons()
        bindTheme()
        updateSatButtons()
    }
    
    func bindTheme() {
        
        primaryBg.tk.backgroundColor = \Theme.background.primary
        secondaryBg.tk.backgroundColor = \Theme.background.secondary
        positiveBg.tk.backgroundColor = \Theme.base.positive

        lb1.tk.textColor = \Theme.text.primary
        lb2.tk.textColor = \Theme.text.secondary
        lb3.tk.textColor = \Theme.text.tertiary
        lbOver.tk.textColor = \Theme.text.overPositive
        
        positiveButton.tk.setTitleColor(\Theme.base.destructive, forState: .normal)
        positiveButton.tk.setTitleColor(\Theme.base.darkPositive, forState: .highlighted)
        
        navigationController?.navigationBar.tk.barTintColor = \Theme.background.bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tk.tintColor = \Theme.base.positive
        navigationController?.navigationBar.tk.titleColor = \Theme.text.primary
        
        imageView.image = UIImage(named: "Check")?.withRenderingMode(.alwaysTemplate)
        imageView.tk.tintColor = \Theme.base.positive
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
        
        color = sender.backgroundColor!
        ThemeManager.shared.changeTheme(with: color, style: style)
    }
    
    @IBAction func selectColor(_ sender: UIButton) {
        
        primaryColor = sender.backgroundColor!
        color = primaryColor
        updateSatButtons()
        ThemeManager.shared.changeTheme(with: color, style: style)
    }
    
    @IBAction func selectLight(_ sender: UIButton) {
        
        style = .light
        let color = ThemeManager.shared.primaryColor
        ThemeManager.shared.changeTheme(with: color, style: style)
    }
    @IBAction func selectDark(_ sender: UIButton) {
        
        style = .dark
        let color = ThemeManager.shared.primaryColor
        ThemeManager.shared.changeTheme(with: color, style: style)
    }
    
    @IBAction func selectNight(_ sender: UIButton) {
        
        style = .night
        let color = ThemeManager.shared.primaryColor
        ThemeManager.shared.changeTheme(with: color, style: style)
    }
}


