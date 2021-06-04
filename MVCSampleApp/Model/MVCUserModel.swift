//
//  MVCUserModel.swift
//  MVCSampleApp
//
//  Created by 尾原徳泰 on 2021/06/02.
//

import Foundation

struct MVCUserModel: Codable {
    var name: String = ""
    var atName: String = ""
    var isOn: Bool = false
    
    // jsonのキーとパラメータの対応付け
    enum CodingKeys: String, CodingKey {
        case name
        case atName = "at_name"
        case isOn = "switch"
    }
    
    var alertText: String {
        name + "\n" + atName
    }
}
