//
//  UITableViewCell+Extension.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/08.
//

import UIKit

protocol Registarable where Self: UIView {
    static var reuseIdentifier: String { get }
}
