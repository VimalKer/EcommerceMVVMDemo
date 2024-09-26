//
//  UIStoryboard + Extenstions.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import Foundation
import UIKit

extension UIStoryboard{
    enum MyStoryboard: String {
        case main
        case news
        case gallery
        var filename: String {
            return rawValue.capitalized
        }
    }
}
let mainStoryboard = UIStoryboard(
    name: UIStoryboard.MyStoryboard.main.filename,
    bundle: nil)


