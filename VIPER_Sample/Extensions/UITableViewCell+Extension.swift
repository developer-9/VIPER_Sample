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

extension Registarable {
    static var reuseIdentifier: String {
        return self.className
    }
}

protocol ClassRegistrable: Registarable {}

protocol NibRegistrable: Registarable {
    static var nib: UINib { get }
}

extension NibRegistrable {
    static var nib: UINib {
        let nibName = String(describing: self)
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}
