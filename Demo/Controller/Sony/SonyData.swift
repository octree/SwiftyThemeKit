//
//  SonyData.swift
//  Demo
//
//  Created by Octree on 2018/8/14.
//  Copyright © 2018年 Octree. All rights reserved.
//

import UIKit

struct Sony {
    
    var photo: UIImage
    var model: String
    var lens: String
    var ev: String
    var iso: String
}

let SonyData = [

    Sony(photo: UIImage(named: "1")!,
         model: "A7m3",
         lens: "200mm f/10.0",
         ev: "1/9 SEC.",
         iso: "200"),
    Sony(photo: UIImage(named: "2")!,
         model: "A7R3",
         lens: "70mm f/4.5",
         ev: "1/199 SEC.",
         iso: "800"),
    Sony(photo: UIImage(named: "3")!,
         model: "A9",
         lens: "16mm f/5.6",
         ev: "9 SEC.",
         iso: "100"),
    Sony(photo: UIImage(named: "4")!,
         model: "A7m3",
         lens: "70mm f/4.0",
         ev: "1/159 SEC.",
         iso: "100"),
    Sony(photo: UIImage(named: "5")!,
         model: "A6300",
         lens: "50mm f/8.0",
         ev: "30 SEC.",
         iso: "800"),
    Sony(photo: UIImage(named: "6")!,
         model: "ILCE-7M3K",
         lens: "200mm f/4.0",
         ev: "1/799 SEC.",
         iso: "100"),
]
