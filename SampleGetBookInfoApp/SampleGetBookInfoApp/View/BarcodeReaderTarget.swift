//
//  BarcodeReaderTarget.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import Foundation
import UIKit

struct BarcodeReaderTarget {
    
    // ターゲット用の赤枠を生成する処理
    func setUpTargetView(vc: UIViewController) {
        let x: CGFloat = vc.view.frame.size.width * 0.1
        let y: CGFloat = vc.view.frame.size.height * 0.4
        let width: CGFloat = vc.view.frame.size.width * 0.8
        let height: CGFloat = vc.view.frame.size.height * 0.2
        
        // 読み取り可能エリアに赤枠を追加
        let barcodeReadAreaView = UIView()
        barcodeReadAreaView.frame = CGRect(
            x: x,
            y: y,
            width: width,
            height: height
        )
        
        barcodeReadAreaView.layer.borderColor = UIColor.red.cgColor
        barcodeReadAreaView.layer.borderWidth = 4
        vc.view.addSubview(barcodeReadAreaView)
    }
}
