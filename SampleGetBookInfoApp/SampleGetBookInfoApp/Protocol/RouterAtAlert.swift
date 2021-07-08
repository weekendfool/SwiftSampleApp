//
//  RouterAtAlert.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/08.
//

import Foundation

protocol RouterAtAlertDelegate {
    // ResultImageViewへ移動するための関数
    func goResultImageView()
    // さいスキャンするための関数
    func reStatBarcodeReader()
}
