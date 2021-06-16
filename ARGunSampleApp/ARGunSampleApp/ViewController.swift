//
//  ViewController.swift
//  ARGunSampleApp
//
//  Created by 尾原徳泰 on 2021/06/11.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var sampleLabel: UILabel! {
        didSet {
            sampleLabel.isHidden = true
        }
    }
    
    let defaultConfiguration: ARWorldTrackingConfiguration = {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.environmentTexturing = .automatic
        return configuration
    }()
    
    lazy var boxNode: SCNNode = {
        let cylinder = SCNCylinder(radius: 0.1, height: 0.05)
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        box.firstMaterial?.diffuse.contents = UIColor.red
        let node = SCNNode(geometry: box)
        node.name = "box"
        node.position = SCNVector3Make(0, 0, -1.5)
        
        let shape = SCNPhysicsShape(geometry: box, options: nil)
        node.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        node.physicsBody?.isAffectedByGravity = false
    
        return node
    }()
    
    @IBAction func gunButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        sceneView.scene = SCNScene()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        sceneView.autoenablesDefaultLighting = true
        
        sceneView.scene.rootNode.addChildNode(boxNode)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    func doPhyisicsView() {
        let ball = SCNSphere(radius: 0.1)
        ball.firstMaterial?.diffuse.contents = UIColor.blue
        
        let node = SCNNode(geometry: ball)
        node.name = "ball"
        node.position = SCNVector3Make(0, 0.1, 0)
        
        let shape = SCNPhysicsShape(geometry: ball, options: nil)
        node.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        node.physicsBody?.contactTestBitMask = 1
        node.physicsBody?.isAffectedByGravity = false
        
        if let camera = sceneView.pointOfView {
            node.position = camera.position
            
            let toPositionCamera = SCNVector3Make(0, 0, -3)
            let toPosition = camera.convertPosition(toPositionCamera, to: nil)
            
            // 射撃に必要なコード
            let move = SCNAction.move(by: toPosition, duration: 0.5)
            move.timingMode = .easeOut
            node.runAction(move) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    node.removeFromParentNode()
                }
            }
        }
        sceneView.scene.rootNode.addChildNode(node)
    }
}
    
