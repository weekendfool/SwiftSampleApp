//
//  Alertview.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/04.
//

import Foundation
import UIKit

struct AlertView {
    
    
    //　デリゲート先を保持する変数
    var routerAtAlertDelegate: RouterAtAlertDelegate?
    
    func setAlertController(vc: UIViewController, metaData: String) {
        
        let alert: UIAlertController = UIAlertController(
            title: "バーコードの中身",
            message: metaData,
            preferredStyle: .alert
        )
        
        let defaultButtonAction: UIAlertAction = UIAlertAction(
            title: "検索する",
            style: UIAlertAction.Style.default
        ) { _ in
            routerAtAlertDelegate?.goResultImageView()
        }
        
        let cancelButtonAction: UIAlertAction = UIAlertAction(
            title: "cancel",
            style: UIAlertAction.Style.cancel
        ) { ＿ in
            routerAtAlertDelegate?.reStatBarcodeReader()
//            print("バーコードを再検索する")
        }
        
        alert.addAction(defaultButtonAction)
        alert.addAction(cancelButtonAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
