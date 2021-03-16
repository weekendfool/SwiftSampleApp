//
//  OperateDatabaseModel.swift
//  GetSampleApp
//
//  Created by 尾原徳泰 on 2021/02/10.
//

import Foundation
import Firebase
import FirebaseFirestore

class OperateDatabase {
    
    // MARK: - データベースの操作に必要な変数宣言
    // データベースへのパスの指定
    var database = Firestore.firestore()
    var ref: DocumentReference? = nil
    // リアルタイム更新に必要な監視状態のフラグ？
    var listener: ListenerRegistration?
    
    weak var view: gotDatasProtocol?
    
    // データ返却用の変数
    var getDataOfStartRealTimeMonitor: Any? = "no data"  {
        didSet {
            view?.checkedGotDatas()
        }
    }
    
   
    
    
    // MARK: - データベースの操作
    // データベースへの書き込み処理
    func writeUserDatabase(targetCollection: String, inputDataDic: [String: Any]) -> String {
        // 格納先、格納するデータを指定して格納
        ref = database.collection(targetCollection).addDocument(data: inputDataDic) { [self] err in
            // エラーが発生した場合
            if let err = err {
                // エラーが発生した場合の目印:print("-----------------------------------------")
                print("-----------------------------------------")
                print("Error At writeUserDatabase(): \(err)")
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
    func writeRoomDatabase(targetCollection: String, inputDocumentName: String, inputDataDic: [String: Any])  {
        // 格納先、格納するデータを指定して格納
        database.collection(targetCollection).document(inputDocumentName).setData(inputDataDic) { err in
            if let err = err {
                // エラーが発生した場合
                print("-----------------------------------------")
                print("Error At makeDatabase(): \(err)")
            } else {
                // 成功した場合
                print("==========================================")
                print("Document successfully Writen: RoomDatabase")
            }
        }
    }
    
    // データベースへの書き込み処理
    func updateDatabase(targetCollection: String, targetDocument: String, TargetFieldName: String, dataOfTarget: Any) {
        // 格納先を指定
        ref = database.collection(targetCollection).document(targetDocument)
        ref!.updateData([TargetFieldName: dataOfTarget]) { (err) in
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
    func searchDatabase(targetCorection: String, targetDocumentName: String) -> Any {
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
    func startRealTimeMonitor(targetCorectionIsUsers: String, targetCorectionIsRooms: String, targetFieldName: String, targetDocumentName: String, numberOfTargets: Int) {
        
        
        
        var target: String?
        // どのfieldを監視するかの場合わけ
        switch numberOfTargets {
        case 1:
            // ユーザーのみ監視
            target = targetCorectionIsUsers
        case 2:
            //　ルームのみ監視
            target = targetCorectionIsRooms
        default:
            return 
        }
        
        // 実際の監視処理
        listener = database.collection(target!).document(targetDocumentName).addSnapshotListener(includeMetadataChanges: false, listener: { [self] documentSnapshot , error  in
            if let error = error {
                print("-----------------------------------------")
                print("Error At startRealTimeMonitor(),numberOfTargets Is : \(error)")
            } else {
                if let document = documentSnapshot {
                    if let data = document.data() {
                        getDataOfStartRealTimeMonitor = data[targetFieldName]!
                        print("========================")
//                        print("Current data: \(data)")
                        print("Current getData: \(getDataOfStartRealTimeMonitor!)")
                        
                    }
                    
                }
            }
        })
        
        
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