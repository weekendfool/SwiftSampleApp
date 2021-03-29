//
//  ProtocolModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/03/09.
//

import Foundation

protocol gotDatasProtocol: class {
    // データが変更されたらコントローラー側で再代入する関数
    func checkedRealTimeMonitorMoveCordinateDic()
    func checkedRealTimeMonitorBetrayersDic()
}
