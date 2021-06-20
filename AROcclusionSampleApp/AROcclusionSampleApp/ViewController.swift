//
//  ViewController.swift
//  AROcclusionSampleApp
//
//  Created by 尾原徳泰 on 2021/06/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートの設定
        sceneView.delegate = self
        // シーンを作成して登録
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
        
        // コンフィギュレーションの作成
        let configuratioon = ARWorldTrackingConfiguration()
        configuratioon.frameSemantics = .personSegmentationWithDepth
        
        // トラッキング開始
        sceneView.session.run(configuratioon)
       
    }
    
}
