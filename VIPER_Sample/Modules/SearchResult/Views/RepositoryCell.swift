//
//  RepositoryCell.swift
//  VIPER_Sample
//
//  Created by Taisei Sakamoto on 2021/12/07.
//

import UIKit

class RepositoryCell: UITableViewCell, NibRegistrable {
    
    @IBOutlet private weak var repositoriesNameLabel: UILabel!
    @IBOutlet private weak var starCountLabel: UILabel!
    
    func setRepository(_ repository: RepositoryEntity) {
        repositoriesNameLabel.text = repository.fullname
        starCountLabel.text = "\(repository.starCount)"
    }
}
