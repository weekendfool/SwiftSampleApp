//
//  TableViewCell.swift
//  TableViewSampleApp
//
//  Created by 尾原徳泰 on 2021/05/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var charaNameLabel: UILabel!
    @IBOutlet weak var consonantNameLabel: UILabel!
    @IBOutlet weak var vowelNameLabel: UILabel!
    @IBOutlet weak var vowelStarImage01: UIImageView!
    @IBOutlet weak var vowelStarImage02: UIImageView!
    @IBOutlet weak var vowelStarImage03: UIImageView!
    @IBOutlet weak var vowelStarImage04: UIImageView!
    @IBOutlet weak var vowelStarImage05: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        charaNameLabel.text = nil
        consonantNameLabel.text = nil
        vowelNameLabel.text = nil
        vowelStarImage01.image = nil
        vowelStarImage02.image = nil
        vowelStarImage03.image = nil
        vowelStarImage04.image = nil
        vowelStarImage05.image = nil
    }
    
    func configure(character: CharacterModel) {
        charaNameLabel.text = character.name
        consonantNameLabel.text = character.consonantName
        vowelNameLabel.text = character.vowelName
        
        switch character.imageCount {
        case 1:
            vowelStarImage01.image = UIImage(named: "image")
            vowelStarImage02.isHidden = true
            vowelStarImage03.isHidden = true
            vowelStarImage04.isHidden = true
            vowelStarImage05.isHidden = true
        case 2:
            vowelStarImage01.image = UIImage(named: "image")
            vowelStarImage02.image = UIImage(named: "image")
            vowelStarImage03.isHidden = true
            vowelStarImage04.isHidden = true
            vowelStarImage05.isHidden = true
        case 3:
            vowelStarImage01.image = UIImage(named: "image")
            vowelStarImage02.image = UIImage(named: "image")
            vowelStarImage03.image = UIImage(named: "image")
            vowelStarImage04.isHidden = true
            vowelStarImage05.isHidden = true
        case 4:
            vowelStarImage01.image = UIImage(named: "image")
            vowelStarImage02.image = UIImage(named: "image")
            vowelStarImage03.image = UIImage(named: "image")
            vowelStarImage04.image = UIImage(named: "image")
            vowelStarImage05.isHidden = true
        case 5:
            vowelStarImage01.image = UIImage(named: "image")
            vowelStarImage02.image = UIImage(named: "image")
            vowelStarImage03.image = UIImage(named: "image")
            vowelStarImage04.image = UIImage(named: "image")
            vowelStarImage05.image = UIImage(named: "image")
        default:
            return
        }
    }
    
    static func cellHeight() -> CGFloat {
        return 100
    }

}
