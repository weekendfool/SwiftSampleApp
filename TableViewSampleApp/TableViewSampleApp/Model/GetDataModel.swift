//
//  GetDataModel.swift
//  TableViewSampleApp
//
//  Created by 尾原徳泰 on 2021/05/23.
//

import Foundation

final class SampleData {
    
    var character = CharacterModel(name: "Non", consonantName: "Non", vowelName: "Non", imageCount: 6)
    
    func getSampleData() -> Any {
        
        var inputDatas = [character]
        
        inputDatas.remove(at: 0)
        for inputData in 0 ..< sampleData.count {
            character.name = sampleData[inputData][0]["name"]! as! String
            character.consonantName = sampleData[inputData][1]["consonantName"]! as! String
            character.vowelName = sampleData[inputData][2]["vowelName"]! as! String
            character.imageCount = sampleData[inputData][3]["imageCount"]! as! Int

            inputDatas.append(character)
        }

        return inputDatas
    }
    
    
    
    var sampleData = [
        [["name": "あ"],
        ["consonantName": "A"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "い"],
        ["consonantName": "A"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "う"],
        ["consonantName": "A"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "え"],
        ["consonantName": "A"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "お"],
        ["consonantName": "A"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "か"],
        ["consonantName": "K"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "き"],
        ["consonantName": "K"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "く"],
        ["consonantName": "K"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "け"],
        ["consonantName": "K"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "こ"],
        ["consonantName": "K"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "さ"],
        ["consonantName": "S"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "し"],
        ["consonantName": "S"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "す"],
        ["consonantName": "S"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "せ"],
        ["consonantName": "S"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "そ"],
        ["consonantName": "S"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "た"],
        ["consonantName": "T"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "ち"],
        ["consonantName": "T"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "つ"],
        ["consonantName": "T"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "て"],
        ["consonantName": "T"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "と"],
        ["consonantName": "T"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "な"],
        ["consonantName": "N"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "に"],
        ["consonantName": "N"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "ぬ"],
        ["consonantName": "N"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "ね"],
        ["consonantName": "N"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "の"],
        ["consonantName": "N"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "は"],
        ["consonantName": "H"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "ひ"],
        ["consonantName": "H"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "ふ"],
        ["consonantName": "H"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "へ"],
        ["consonantName": "H"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "ほ"],
        ["consonantName": "H"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "ま"],
        ["consonantName": "M"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "み"],
        ["consonantName": "M"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "む"],
        ["consonantName": "M"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "め"],
        ["consonantName": "M"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "も"],
        ["consonantName": "M"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "や"],
        ["consonantName": "Y"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "ゆ"],
        ["consonantName": "Y"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "よ"],
        ["consonantName": "Y"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "ら"],
        ["consonantName": "R"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "り"],
        ["consonantName": "R"],
        ["vowelName": "I"],
        ["imageCount": 2]],
        [["name": "る"],
        ["consonantName": "R"],
        ["vowelName": "U"],
        ["imageCount": 3]],
        [["name": "れ"],
        ["consonantName": "R"],
        ["vowelName": "E"],
        ["imageCount": 4]],
        [["name": "ろ"],
        ["consonantName": "R"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        
        [["name": "わ"],
        ["consonantName": "W"],
        ["vowelName": "A"],
        ["imageCount": 1]],
        [["name": "を"],
        ["consonantName": "W"],
        ["vowelName": "O"],
        ["imageCount": 5]],
        [["name": "ん"],
        ["consonantName": "Non"],
        ["vowelName": "Non"],
        ["imageCount": 5]]
    ]
    
}
