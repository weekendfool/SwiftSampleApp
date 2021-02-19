//
//  OperateDatabaseModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//

import Foundation
import Firebase
import FirebaseFirestore

struct OperateDatabase {
    
    // MARK: - データベースの操作に必要な変数宣言
    // データベースへのパスの指定
    var database = Firestore.firestore()
    var ref: DocumentReference? = nil
    // リアルタイム更新に必要な監視状態のフラグ？
    var listener: ListenerRegistration?
    
    // MARK: - データベースの操作
    // データベースへの書き込み処理
    mutating func makeDatabase(targetCollection: String, inputDataDic: [String: Any]) -> String {
        // 格納先、格納するデータを指定して格納
        ref = database.collection(targetCollection).addDocument(data: inputDataDic) { [self] err in
            // エラーが発生した場合
            if let err = err {
                // エラーが発生した場合の目印:print("-----------------------------------------")
                print("-----------------------------------------")
                print("Error At makeDatabase(): \(err)")
            }
        }
        // 成功した場合
            // 成功した場合の目印:print("==========================================")
            print("==========================================")
            print("document added with ID: \(ref!.documentID)")
        // ユーザーのユニークIDを発行してもらう
        return ref!.documentID
        
    }
    
    // データベースへの書き込み処理
    mutating func makeDatabase2(targetCollection: String, inputName: String, inputDataDic: [String: Any]) {
        // 格納先、格納するデータを指定して格納
         database.collection(targetCollection).document(inputName).setData(inputDataDic)
        
    }
    // データベースへの書き込み処理
    mutating func updateDatabase(targetCollection: String, userID: String, TargetFieldName: String, dicOfTarget: [String: Any]) {
        // 格納先を指定
        ref = database.collection(targetCollection).document(userID)
        ref!.updateData([TargetFieldName: dicOfTarget[TargetFieldName]]) { (err) in
            // エラーが発生した場合
            if let err = err {
                print("-----------------------------------------")
                print("Error At updateDatabase(): \(err)")
            } else {
            // 成功した場合
                print("==========================================")
                print("document successfully updated")
            }
        }
    }
    
    // データベースの検索処理
    mutating func searchDatabase(targetCorection: String, targetFieldName: String, dicOfTarget: [String: Any]) -> Any {
        // 検索したい条件を設定
        var docRef = database.collection(targetCorection).whereField(targetFieldName, isEqualTo: dicOfTarget[targetFieldName])
        // データ返却用の変数
        var getData: Any?
        // 実際に検索する
        docRef.getDocuments { [self] (querySnapshot, err) in
            if let err = err {
                print("-----------------------------------------")
                print("Error At searchDatabase(): \(err)")
            } else {
                print("==========================================")
                print("document successfully searched")
                for document in querySnapshot!.documents {
                    // 取得したデータを返却
                    getData = document.data()[targetFieldName]
                                        
                }
            }
        }
        return getData!

    }
    
    // データベースの検索処理
    mutating func searchDatabase2(targetCorection: String, targetDocumentName: String) -> Any {
        // 検索したい条件を設定
        var docRef = database.collection(targetCorection).document(targetDocumentName)
        // データ返却用の変数
        var getData: Any?
        // 実際に検索する
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("==========================================")
                print("Document data: \(dataDescription)")
                getData = dataDescription
            } else {
                print("-----------------------------------------")
                print("Error At searchDatabase(): \(err)")
            }
        }
        
        return getData!

    }
    
    // データベースのリアルタイム更新の監視開始処理
    mutating func startRealTimeMonitor(targetCorectionIsUsers: String, targetCorectionIsRooms: String, targetFieldName: String, numberOfTargets: Int) -> Any {
        // データ返却用の変数
        var getData: Any
        // どのfieldを監視するかの場合わけ
        switch numberOfTargets {
        case 1:
            // ユーザーのみ監視
            getData = getDatas(targetCorection: targetCorectionIsUsers, targetFieldName: targetFieldName)
        case 2:
            //　ルームのみ監視
            getData = getDatas2(targetCorection: targetCorectionIsRooms, targetFieldName: targetFieldName)
        case 3:
            // ユーザー、ルーム両方監視
            getData = getDatas(targetCorection: targetCorectionIsUsers, targetFieldName: targetFieldName)
            getData = getDatas(targetCorection: targetCorectionIsRooms, targetFieldName: targetFieldName)
            
        default:
            return "Error at startRealTimeMonitor"
        }
        return getData
    }
    
    // リアルタイム更新でデータを取得する関数
    mutating func getDatas(targetCorection: String, targetFieldName: String) -> Any {
        // データ返却用の変数
        var getData: Any?
        listener = database.collection(targetCorection).addSnapshotListener {
            documentSnapshot, err in
            if let err = err {
                print("-----------------------------------------")
                print("Error At startRealTimeMonitor(),numberOfTargets Is \(targetCorection): \(err)")
            } else {
                // 更新されたデータを取得
                if let documentSnapshots = documentSnapshot?.documents {
                    for document in documentSnapshots {
                        getData = document.data()[targetFieldName]
                    }
                }
            }
        }
        return getData
    }
    
    mutating func getDatas2(targetCorection: String, targetFieldName: String) -> String {
        var data2 = ""
        database.collection(targetCorection).addSnapshotListener { documentSnapshot, err in
            if let err = err {
                print("-------------------------------------")
                print("ドキュメントの取得に失敗しました:\(err)")
            } else {
                if let documentSnapshots = documentSnapshot?.documents {
                    for document in documentSnapshots {
                        let data = document.data()
                        data2 = data[targetFieldName] as! String
//                        data2 = data as! String
                        print("=====================================")
                        print(data2)
                    }
                }
            }
        }
        return data2
    }
    
    // データベースのリアルタイム更新の監視終了処理
    func stopRealTimeMonitor() {
        listener?.remove()
        
    }
    // データベースの削除処理
    // ユーザーの退会時
    // ルームの削除時に使用
    func deleteDatabaseDocumentData(targetCorection: String, targetDocument: String) {
        database.collection(targetCorection).document(targetDocument).delete() { err in
            if let err = err {
                print("-----------------------------------------")
                print("Error At deleteDatabaseDocumentData(): \(err)")
            } else {
                print("==========================================")
                print("document successfully deleted")
            }
        }
    }
    
    // ユーザー内のフラグやroomID削除時に使用
    func deleteFieldDocumentData(targetCorection: String, targetDocument: String, targetField: String) {
        database.collection(targetCorection).document(targetDocument).updateData([targetField: FieldValue.delete(),
        ]) { err in
            if let err = err {
                print("-----------------------------------------")
                print("Error At deleteFieldDocumentData(): \(err)")
            } else {
                print("==========================================")
                print("document successfully updateDated")
            }
        }
    }
}
