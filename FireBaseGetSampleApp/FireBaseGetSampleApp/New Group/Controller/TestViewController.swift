//
//  TestViewController.swift
//  FireBaseGetSampleApp
//
//  Created by 尾原徳泰 on 2020/11/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func makeTest() {
        let db = Firestore.firestore()
        let citiesRef = db.collection("cities")

        citiesRef.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000,
            "regions": ["west_coast", "norcal"]
            ])
        citiesRef.document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 3900000,
            "regions": ["west_coast", "socal"]
            ])
        citiesRef.document("DC").setData([
            "name": "Washington D.C.",
            "country": "USA",
            "capital": true,
            "population": 680000,
            "regions": ["east_coast"]
            ])
        citiesRef.document("TOK").setData([
            "name": "Tokyo",
            "country": "Japan",
            "capital": true,
            "population": 9000000,
            "regions": ["kanto", "honshu"]
            ])
        citiesRef.document("BJ").setData([
            "name": "Beijing",
            "country": "China",
            "capital": true,
            "population": 21500000,
            "regions": ["jingjinji", "hebei"]
            ])

    }
    
    @IBAction func testButtonAction(_ sender: Any) {
        makeTest()
    }
    
   

}
