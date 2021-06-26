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
        
        spherelNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        spherelNode.physicsBody?.mass = 1.0
        spherelNode.physicsBody?.friction = 1.5
        spherelNode.physicsBody?.rollingFriction = 1.0
        spherelNode.physicsBody?.damping = 0.5
        spherelNode.physicsBody?.angularDamping = 0.5
        spherelNode.physicsBody?.isAffectedByGravity = true
        
        spherelNode.physicsBody?.applyForce(SCNVector3(0, 1.5, 0), asImpulse: true)
        
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
    
    // 画面を更新した時に呼ばれる
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { fatalError() }
        guard let geometryPlaneNode = node.childNodes.first, let planeGeometry = geometryPlaneNode.geometry as? SCNPlane else { fatalError() }
        
        // ジオメトリをアップデートする
        planeGeometry.width = CGFloat(planeAnchor.extent.x)
        planeGeometry.height = CGFloat(planeAnchor.extent.z)
        geometryPlaneNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        
        // 平面に対しての設定
        geometryPlaneNode.physicsBody = SCNPhysicsBody(type: .kinematic, shape: SCNPhysicsShape(geometry: planeGeometry, options: nil))
    }
}
