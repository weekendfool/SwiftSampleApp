//
//  ViewController.swift
//  PhysicsSampleApp
//
//  Created by 尾原徳泰 on 2021/06/22.
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
        // シーンの作成と登録
        sceneView.scene = SCNScene()
        
        // 特徴点を描画
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // ライトの追加
        sceneView.autoenablesDefaultLighting = true
        
        // 平面を検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    //球の追加
    func addSphere(hitResult: ARHitTestResult) {
        // ノードの作成
        let spherelNode = SCNNode()
        
        // Geometryとtoransformの設定
        let sphereGeometry = SCNSphere(radius: 0.03)
        spherelNode.geometry = sphereGeometry
        spherelNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y + 0.05, hitResult.worldTransform.columns.3.z)
        
        // ノードの追加
        sceneView.scene.rootNode.addChildNode(spherelNode)
    }
    
    // 画面タップ時の挙動
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchPos = touch.location(in: sceneView)
        
        let hitTestResult = sceneView.hitTest(touchPos, types: .existingPlaneUsingExtent)
        if !hitTestResult.isEmpty {
            if let hitResult = hitTestResult.first {
                addSphere(hitResult: hitResult)
            }
        }
    }
}
