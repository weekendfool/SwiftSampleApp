//
//  questBoardTableViewCell.swift
//  RewardToDoApp
//
//  Created by 尾原徳泰 on 2020/07/04.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import CoreData

class QuestBoardTableViewCell: UITableViewCell {
    
    //パーツの紐付け
    @IBOutlet weak var questBoardTableViewCellButton: UIButton!
    @IBOutlet weak var questBoardTableViewCellDateLabel: UILabel!
    @IBOutlet weak var questBoardTableViewCellDoLabel: UILabel!
    @IBOutlet weak var questBoardTableViewCellRewardPointLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func questBoardTableViewCellButtonAction(_ sender: Any) {
    }
    
}
