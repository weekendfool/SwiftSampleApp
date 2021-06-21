//
//  ViewController.swift
//  2dBodySampleApp
//
//  Created by 尾原徳泰 on 2021/06/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートを設定
        sceneView.session.delegate = self
        // コンフィギュレーションを設定
        let configuration = ARWorldTrackingConfiguration()
        configuration.frameSemantics = .bodyDetection
        sceneView.session.run(configuration)
        
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        // レイヤをクリア
        sceneView.layer.sublayers?.compactMap { $0 as? CAShapeLayer }.forEach{ $0.removeFromSuperlayer() }
        
        guard let interfaceOrientation = sceneView.window?.windowScene?.interfaceOrientation else { return }
        let transform = frame.displayTransform(for: interfaceOrientation, viewportSize: sceneView.frame.size)
        
        if let detectedBody = frame.detectedBody {
            // 右手の位置を取得
            guard let rightHandPos = detectedBody.skeleton.landmark(for: ARSkeleton.JointName.rightHand) else { return }
            
            // ディスプレイ座標に変換
            let normalizedCenter = CGPoint(x:CGFloat(rightHandPos.x), y: CGFloat(rightHandPos.y)).applying(transform)
            let center = normalizedCenter.applying(CGAffineTransform.identity.scaledBy(x: sceneView.frame.width, y: sceneView.frame.height))
            
            // 円を描画
            let radius: CGFloat = 8.0
            let rect = CGRect(origin: CGPoint(x: center.x - radius, y: center.y - radius), size: CGSize(width: radius * 2, height: radius * 2))
            let circleLayer = CAShapeLayer()
            circleLayer.fillColor = UIColor.red.cgColor
            circleLayer.path = UIBezierPath(ovalIn: rect).cgPath
            sceneView.layer.addSublayer(circleLayer)
        }
    }
    
}
