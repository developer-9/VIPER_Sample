//
//  UITableView+Extension.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/08.
//

import UIKit

extension UITableView {
    
    func register<T: Registarable & UITableViewCell>(_ registrableType: T.Type) {
        switch registrableType {
        case let nibRegistrableType as NibRegistrable.Type:
            register(nibRegistrableType.nib, forCellReuseIdentifier: nibRegistrableType.reuseIdentifier)
        case let classRegistrableType as ClassRegistrable.Type:
            register(classRegistrableType, forCellReuseIdentifier: classRegistrableType.reuseIdentifier)
        default:
            assertionFailure("\(registrableType) is unknown type")
        }
    }
    
    func dequeueReusableCell<T: Registarable & UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with type \(T.self)")
        }
        return cell
    }
}
