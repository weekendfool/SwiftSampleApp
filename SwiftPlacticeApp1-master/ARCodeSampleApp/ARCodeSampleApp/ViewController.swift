//
//  ViewController.swift
//  ARTickTacToeApp
//
//  Created by 尾原徳泰 on 2020/09/09.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    // パーツの紐付け
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var number1Button: UIButton!
    @IBOutlet weak var number2Button: UIButton!
    @IBOutlet weak var number3Button: UIButton!
    @IBOutlet weak var number4Button: UIButton!
    @IBOutlet weak var number5Button: UIButton!
    @IBOutlet weak var number6Button: UIButton!
    @IBOutlet weak var number7Button: UIButton!
    @IBOutlet weak var number8Button: UIButton!
    @IBOutlet weak var number9Button: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - AR用の変数群
    // fieldの座標を記録する変数
    var fieldPoint:SCNVector3?
    // fieldのNodeを記録する変数
    var fieldNode:SCNNode?
    // pawanの色を格納する変数
    var pawnNode:SCNNode?
    // fieldが展開されているかどうかの確認用変数
    var fieldCounter:Bool?
    
    // MARK: - 三目並べ用の変数群
    //プレイヤーの変数
    var player = 0
    //奇数か偶数かの保持
    var playerCount = 0
    //マスの色を記録する辞書
    var colorDic: [Int: Int] = [1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
    //ボタンの選択個数を保持する変数
    var buttonCount = 0
    //場所移動する選択肢の数字を格納する辞書
    var buttonDic: [Int: Int] = [0:0, 1:0]
    // startButtonの状態記録用変数
    var startButtonOn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // デリゲートの設定
        sceneView.delegate = self
        // シーンの作成
        sceneView.scene = SCNScene()
        
        // 特徴点を表示する
//        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        //　光源の設定
        sceneView.autoenablesDefaultLighting = true
        // 平面の検出
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
        
        var users: [Player, Player] = [new Player(), new Player()]
        
        // fieldCounterの初期化
        fieldCounter = false
        // playerCountの初期化
        playerCount = 1
        // playerの初期化
        player = 0
        // startButtonOnの初期化
        startButtonOn = 0
        setButton(startButtonOn: startButtonOn)
        setButtonborder()
        // ラベルに初期値を設定
        mainLabel.text = "ARTickTacToe"
        // resetButtonOnの初期化
        resetButton.isEnabled = false
    }
    // MARK: - カメラ座標の中心座標を記録してフィールドを展開する処理
    func makeField() {
        // 座標の決定
        //　カメラ座標系で50㎝手前にfieldの中心を設置
        let infrontOfCamera = SCNVector3(x: 0, y: 0, z: -0.5)
        
        //　カメラ座標系からワールド座標系に変換する
        guard let cameraNode = sceneView.pointOfView else { return }
        let pointInWorld = cameraNode.convertPosition(infrontOfCamera, to: nil)
        // 変換した座標を記録
        fieldPoint = pointInWorld
        
        // scnファイルからシーンを読みこむ
        let fieldScene = SCNScene(named: "art.scnassets/field.scn")
        // シーンからノードを検索
        fieldNode = (fieldScene?.rootNode.childNode(withName: "field", recursively: false))!
        // 表示する座標を指定
        fieldNode!.position = pointInWorld
        // ノードの作成
        sceneView.scene.rootNode.addChildNode(fieldNode!)
        // ラベルに初期値を設定
        mainLabel.text = "1Pのターン"
    }
    
    // MARK: - ポーンを生成する処理
    func makePawn(playerCount: Int, fieldNumber: Int) {
        
//        // pawanの場所を格納する変数
//        var pawnPoint:SCNVector3?
        //　fieldのオブジェクト座標から計算で出した値を格納する変数を３軸文用意
        var newStagePintX:Float?
        var newStagePintZ:Float?
        var newStagePintY:Float?
        
        // pleyerCountにより赤か青か場合わけ
        if playerCount == 1 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/redPawn.scn")
            // シーンからノードを検索
            let redNode = (scene?.rootNode.childNode(withName: "redPawn", recursively: false))!
            pawnNode = redNode
        } else if playerCount == 2 {
            // scnファイルからシーンを読み込む
            let scene = SCNScene(named: "art.scnassets/bluePawn.scn")
            // シーンからノードを検索
            let blueNode = (scene?.rootNode.childNode(withName: "bluePawn", recursively: false))!
            pawnNode = blueNode
        }
        // 選択された場所により生成する場所の座標を変える
        switch fieldNumber {
        case 1:
            newStagePintX = fieldPoint!.x - 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z - 0.096
        case 2:
            newStagePintX = fieldPoint!.x + 0.000; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z - 0.096
        case 3:
            newStagePintX = fieldPoint!.x + 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z - 0.096
        case 4:
            newStagePintX = fieldPoint!.x - 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.000
        case 5:
            newStagePintX = fieldPoint!.x + 0.000; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.000
        case 6:
            newStagePintX = fieldPoint!.x + 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.000
        case 7:
            newStagePintX = fieldPoint!.x - 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.096
        case 8:
            newStagePintX = fieldPoint!.x + 0.000; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.096
        case 9:
            newStagePintX = fieldPoint!.x + 0.098; newStagePintY = fieldPoint!.y + 0.081; newStagePintZ = fieldPoint!.z + 0.096
        default:
            return
        }
//        //ワールド座標からfieldのオブジェクト座標に変換して計算
//        let osition = fieldNode!.convertPosition(fieldPoint!, to: pwanNode)
        
        // 新しいオブジェクトの座標を規定
        let newFieldPoint = SCNVector3(x: newStagePintX!, y: newStagePintY!, z: newStagePintZ!)
        //　ワールド座標系に変換
        print("newStagePoint:\(newFieldPoint)")
//        let finalPoint = sceneView.projectPoint(newFieldPoint)
//        print("finalPoint:\(finalPoint)")
        // ノードの大きさ変更
        pawnNode!.scale = SCNVector3(0.02, 0.02, 0.02)
        // 表示する座標を指定する
        pawnNode!.position = newFieldPoint
        // ノードの作成
        sceneView.scene.rootNode.addChildNode(pawnNode!)
        
       }
    
    // MARK: - ARオブジェクトを消す処理
    func deleteAR() {
        // ノードの削除
        if let field = fieldNode {
            field.removeFromParentNode()
        }
        if let pawn = pawnNode {
            pawn.removeFromParentNode()
        }
        print("OK")
    }
    //MARK: - ボタンの色変え
    func changeCouler(number: Int, player: Int) {
        var place:UIButton?
        //どのボタンが押されたかの条件分岐
        switch number {
        case 1:
            place = number1Button
        case 2:
            place = number2Button
        case 3:
            place = number3Button
        case 4:
            place = number4Button
        case 5:
            place = number5Button
        case 6:
            place = number6Button
        case 7:
            place = number7Button
        case 8:
            place = number8Button
        case 9:
            place = number9Button
        default:
            return
        }
        
        if player == 1 {
            //ボタンの色を変える処理
            place?.backgroundColor = UIColor.red
            //ボタンの文字色を変える処理
            place?.setTitleColor(UIColor.gray, for: .normal)
            //色を塗ったことを記録
            colorDic[number] = 1
        } else if player == 2 {
            //ボタンの色を変える処理
            place?.backgroundColor = UIColor.blue
            //ボタンの文字色を変える処理
            place?.setTitleColor(UIColor.gray, for: .normal)
            //色を塗ったことを記録
            colorDic[number] = 2
        }
        //二回以上選択できなくする処理
        place?.isEnabled = false
    }
    
    //MARK: - プレイヤーの選択
    func judgmentPlayerNumber(playerCount: Int) {
        // playerCountが奇数か偶数かで１pか２pかを判断する
        if (playerCount % 2) == 1 {
            //奇数なら１p
            player = 1
        } else {
            //偶数なら２p
            player = 2
        }
        
    }
    
    //MARK: - ボタンの枠線を設定
       func setButtonborder() {
           //for文で全てのボタンに枠線を設定する
           for num in 1...9 {
               var selectButtton: UIButton?
               //switch文でどのボタンが押されたかの条件分岐
               switch num {
               case 1:
                   selectButtton = number1Button
               case 2:
                   selectButtton = number2Button
               case 3:
                   selectButtton = number3Button
               case 4:
                   selectButtton = number4Button
               case 5:
                   selectButtton = number5Button
               case 6:
                   selectButtton = number6Button
               case 7:
                   selectButtton = number7Button
               case 8:
                   selectButtton = number8Button
               case 9:
                   selectButtton = number9Button
               default:
                   return
               }
            //buttonの枠線の色を設定
            selectButtton?.layer.borderColor = UIColor.gray.cgColor
            //buttonの枠線の幅を設定
            selectButtton?.layer.borderWidth = 2.0
            // 枠線の角を丸く
            selectButtton?.layer.cornerRadius = 10
               }
           
       }
    
    //MARK: - ボタンの初期化
    func setButton(startButtonOn: Int) {
        
        //for文で全てのボタンの設定をする
        for num in 1...9 {
            var selectButtton: UIButton?
            //switch文でどのボタンが押されたかの条件分岐
            switch num {
            case 1:
                selectButtton = number1Button
            case 2:
                selectButtton = number2Button
            case 3:
                selectButtton = number3Button
            case 4:
                selectButtton = number4Button
            case 5:
                selectButtton = number5Button
            case 6:
                selectButtton = number6Button
            case 7:
                selectButtton = number7Button
            case 8:
                selectButtton = number8Button
            case 9:
                selectButtton = number9Button
            default:
                return
            }
            if startButtonOn == 0 {
                //buttonの無効化
                selectButtton?.isEnabled = false
            } else if startButtonOn == 1 {
                //buttonの有効化
                selectButtton?.isEnabled = true
            }
            
            }
    }
    
    //MARK: - ボタンのActionを関数化
    func butttonActionGroup(number: Int) {
        //プレイヤーを選別
        print("playerCount5:\(playerCount)")
        judgmentPlayerNumber(playerCount: playerCount)
        //色を変える処理
        changeCouler(number: number, player: player)
        //色を記録する処理
        saveDrowPLaceOfColor(number: number)
        // pwanの生成処理
        makePawn(playerCount: player, fieldNumber: number)
        //勝敗の判定
        judgmentWiner()
        //playerCountのカウントをすすめる
        playerCount += 1
        if (playerCount % 2) == 0 {
            // ラベルの文字を設定
            mainLabel.text = "1Pのターン"
        } else {
            // ラベルの文字を設定
            mainLabel.text = "1Pのターン"
        }
       
       }
    
    //MARK: - 塗られた箇所の色の記録
    func saveDrowPLaceOfColor(number: Int) {
        if player == 1 {
            //色を塗ったことを記録
            colorDic[number] = 1
        } else if player == 2 {
            //色を塗ったことを記録
            colorDic[number] = 2
        }
        //確認用
        print(colorDic)
    }
    
    //MARK: - 勝負の判定機能
    func judgmentWiner() {
        //勝敗が決まるかの判定を二色分for文で行う
        let dic1 = colorDic[1]
        let dic2 = colorDic[2]
        let dic3 = colorDic[3]
        let dic4 = colorDic[4]
        let dic5 = colorDic[5]
        let dic6 = colorDic[6]
        let dic7 = colorDic[7]
        let dic8 = colorDic[8]
        let dic9 = colorDic[9]
        var count = 0
        //勝敗が決まるかの判定を二色分for文で行う
        for num in 1...2 {
            if (dic1 == num && dic2 == num && dic3 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if (dic4 == num && dic5 == num && dic6 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if (dic7 == num && dic8 == num && dic9 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if (dic1 == num && dic4 == num && dic7 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if (dic2 == num && dic5 == num && dic8 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if (dic3 == num && dic6 == num && dic9 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if (dic1 == num && dic5 == num && dic9 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if (dic3 == num && dic5 == num && dic7 == num) {
                print("Win:\(num)P")
                mainLabel.text = "Win:\(num)P"
                stopButtonAction()
                count = 1
            } else if playerCount == 9 && count == 0 {
                mainLabel.text = "ドロー"
            }
        }
        
    }
    
    
    //MARK: - 勝敗が確定した時のボタン凍結機能
    func stopButtonAction() {
        //for文で全てのボタンを選択できなくする
        for num in 1...9 {
            var selectButtton: UIButton?
            //switch文でどのボタンが押されたかの条件分岐
            switch num {
            case 1:
                selectButtton = number1Button
            case 2:
                selectButtton = number2Button
            case 3:
                selectButtton = number3Button
            case 4:
                selectButtton = number4Button
            case 5:
                selectButtton = number5Button
            case 6:
                selectButtton = number6Button
            case 7:
                selectButtton = number7Button
            case 8:
                selectButtton = number8Button
            case 9:
                selectButtton = number9Button
            default:
                return
            }
            //buttonを選択できなくする
            selectButtton?.isEnabled = false
            }
    }
    
     //MARK: - リセット機能
    func resetAction() {
        //変数の初期化
        playerCount = 1
        player = 0
        //for文で全てのボタンの色の初期化する
        for num in 1...9 {
            colorDic[num] = 0
        }
        
        //for文で全てのボタンの色の初期化する
        for num in 1...9 {
            var selectButtton: UIButton?
            //switch文でどのボタンが押されたかの条件分岐
            switch num {
            case 1:
                selectButtton = number1Button
            case 2:
                selectButtton = number2Button
            case 3:
                selectButtton = number3Button
            case 4:
                selectButtton = number4Button
            case 5:
                selectButtton = number5Button
            case 6:
                selectButtton = number6Button
            case 7:
                selectButtton = number7Button
            case 8:
                selectButtton = number8Button
            case 9:
                selectButtton = number9Button
            default:
                return
            }
            selectButtton?.backgroundColor = UIColor.clear
            //ボタンの文字色を変える処理
            selectButtton?.setTitleColor(UIColor.systemBlue, for: .normal)
            selectButtton?.isEnabled = true
        }
        
    }
    
    // MARK: - ボタン押した時の処理
    @IBAction func number1ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 1)
    }
    
    @IBAction func number2ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 2)
    }
    
    @IBAction func number3ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 3)
    }
    
    @IBAction func number4ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 4)
    }
    
    @IBAction func number5ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 5)
    }
    
    @IBAction func number6ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 6)
    }
    
    @IBAction func number7ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 7)
    }
    @IBAction func number8ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 8)
    }
    
    @IBAction func number9ButtonAction(_ sender: Any) {
        butttonActionGroup(number: 9)
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        // fieldが展開されているかどうかの場合わけ
        if !fieldCounter! {
            // もしfieldが未展開なら展開処理を起動
            makeField()
            // fieldCounterを展開状態に書き換える
            fieldCounter = true
            // startButtonを押せないようにロックをかける
            startButton.isEnabled = false
            // pawn設置用のボタンを押せるように設定変更
            startButtonOn = 1
            setButton(startButtonOn: startButtonOn)
            // resetButtonを押せるように設定
            resetButton.isEnabled = true
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        // buttonの色や無効化を解除
        resetAction()
        // pawn設置用のボタンを押せないように設定変更
        startButtonOn = 0
        // startButtonを押せるようにロックを解除する
        startButton.isEnabled = true
        // オブジェクトの削除
        deleteAR()
        // ラベルに初期値を設定
        mainLabel.text = "ARTickTacToe"
        // resetButtonを押せないようにロックをかける
        resetButton.isEnabled = false
        // fieldCounterをnot展開状態に書き換える
        fieldCounter = false
        
    }
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

