//
//  UIView+Extension.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/08.
//

import UIKit

extension UIView {
    static var className: String {
        return String(describing: self)
    }
    
    static func createNib(bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: className, bundle: bundle)
    }
}
