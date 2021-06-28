//
//  ViewController.swift
//  PhotoARSampleApp
//
//  Created by 尾原徳泰 on 2021/06/27.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lunchAR()
        ARImageTracking()
    }
    
    func lunchAR() {
        // デリゲートを設定
        sceneView.delegate = self
        // シーンを作成して登録
        sceneView.scene = SCNScene()
        // ライトの追加
        sceneView.autoenablesDefaultLighting = true
    }
    
    func ARImageTracking() {
        var arImage = UserDefaults.standard.value(forKey: "photo")
        
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = arImage as! Set<ARReferenceImage>
//        configuration.trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)!
        
        sceneView.session.run(configuration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        let boxNode = SCNNode()
        boxNode.geometry = SCNBox(width: 0.05, height: 0.05, length: 0.05, chamferRadius: 0)
        boxNode.position.y = 0.025
        
        node.addChildNode(boxNode)
    }
}
