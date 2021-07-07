//
//  Alertview.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/04.
//

import Foundation
import UIKit

struct AlertView {
    //
    func setAlertController(vc: UIViewController, metaData: String, defaultButtonAction: Void, cancelButtonAction: Void) {
        
        let alert: UIAlertController = UIAlertController(
            title: "バーコードの中身",
            message: metaData,
            preferredStyle: .alert
        )
        
        let defaultButtonAction: UIAlertAction = UIAlertAction(
            title: "検索する",
            style: UIAlertAction.Style.default
        ) { defaultButtonAction in
            print("コードで遷移する")
        }
        
        let cancelButtonAction: UIAlertAction = UIAlertAction(
            title: "cancel",
            style: UIAlertAction.Style.cancel
        ) { cancelButtonAction in
            print("バーコードを再検索する")
        }
        
        alert.addAction(defaultButtonAction)
        alert.addAction(cancelButtonAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
