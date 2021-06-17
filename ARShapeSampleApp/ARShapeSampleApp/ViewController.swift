//
//  ViewController.swift
//  ARShapeSampleApp
//
//  Created by 尾原徳泰 on 2021/06/18.
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
        sceneView.scene = SCNScene()
        // 特徴点を描画
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        // 平面を検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
}
