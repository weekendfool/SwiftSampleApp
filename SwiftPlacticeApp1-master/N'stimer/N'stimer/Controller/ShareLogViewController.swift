//
//  ShareLogViewController.swift
//  N'stimer
//
//  Created by 尾原徳泰 on 2020/04/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ShareLogViewController: UIViewController {

    @IBOutlet weak var totalPeriodsLabel: UILabel!
    @IBOutlet weak var totalHourLable: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    //シェアテキスト配列
    var shareTextArray:[Any] = []
    //ピリオド数
    var sumPiriod = 0
    //合計時間数
    var sumTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //保存された時間の引き出し
        sumPiriod = UserDefaults.standard.integer(forKey: "sumPiriod")
        sumTime = Double(sumPiriod) * 0.5
        totalPeriodsLabel.text = "本日\(sumPiriod)ピリオド"
        totalHourLable.text = "本日\(sumTime)時間"
        
        
    }
    


    @IBAction func shareButtonAction(_ sender: Any) {
        shareTextArray.append("ピリオド：\(sumPiriod)、")
        shareTextArray.append("合計時間：\(sumTime)")
        let controller = UIActivityViewController(activityItems: shareTextArray, applicationActivities: nil)
        present(controller, animated: true, completion: nil)
        
        
    }
    
}
