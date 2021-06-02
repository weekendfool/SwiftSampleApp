//
//  MVCCountryTableViewCell.swift
//  MVCSampleApp
//
//  Created by 尾原徳泰 on 2021/06/02.
//

import UIKit

final class MVCCountryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var countryImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var moneyRationalLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        countryImageView.image = nil
        nameLabel.text = nil
        moneyRationalLabel.text = nil
    }
    
    func configure(country: MVCCountryModel) {
        countryImageView.image = UIImage.init(named: country.imageName)
        nameLabel.text = country.name
        moneyRationalLabel.text = country.moneyRatio.description
    }
    
}

