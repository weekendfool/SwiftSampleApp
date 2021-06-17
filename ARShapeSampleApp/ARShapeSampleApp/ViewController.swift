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
    
    private let device = MTLCreateSystemDefaultDevice()!
    
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
    
    // 平面の検出時の挙動
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { fatalError() }
        
        // 平面ジオメトリの作成
        let planeGeometry = ARSCNPlaneGeometry(device: device)!
        planeGeometry.update(from: planeAnchor.geometry)
        planeGeometry.materials.first?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
        
        // 平面ノードの作成
        let planeNode = SCNNode()
        planeNode.geometry = planeGeometry
        
        // ノードの追加
        node.addChildNode(planeNode)
    }
}
