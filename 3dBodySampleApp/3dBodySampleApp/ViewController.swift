//
//  ViewController.swift
//  3dBodySampleApp
//
//  Created by 尾原徳泰 on 2021/06/22.
//

import UIKit
import Combine
import ARKit
import RealityKit
import SceneKit

class ViewController: UIViewController, ARSessionDelegate {

   
    @IBOutlet var sceneView: ARView!
    
    var character = ARBodyAnchor
        
    let characterAnchor = AnchorEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}
