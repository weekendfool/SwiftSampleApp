//
//  Alart.swift
//  AlertSampleApp
//
//  Created by 尾原徳泰 on 2021/07/07.
//

import Foundation
import UIKit

struct MakeAlert {
    
    func makeAlert(vc: UIViewController, buttonAction: Void) {
        
        // アラートの形式を指定
        let alertView: UIAlertController = UIAlertController(
            title: "test",
            message: "実行",
            preferredStyle: .alert
        )
        
        //button押した時のアクションの設定
        let alertAction: UIAlertAction = UIAlertAction(title: "ok", style: .default) { buttonAction in
            buttonAction
        }
        
        alertView.addAction(alertAction)
        vc.present(vc, animated: true, completion: nil)
    }
    
    
    
}
