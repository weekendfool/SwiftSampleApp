//
//  CoreData.swift
//  RewardToDoApp
//
//  Created by 尾原徳泰 on 2020/07/23.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit
import CoreData

//entityのTodoList型の配列を宣言
var todoListArray:[TodoList] = []

// MARK: - 共通todoListの何番目の情報かを記録するプロパティ
var coreDataCount:Int?

class CoreData {
    
//    //entityのTodoList型の配列を宣言
//    var todoListArray:[TodoList] = []
    var coreDataCount:Int?
    
    //オブジェクト化する
    var managedOfContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //取得したいデータの条件
    let conditions = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoList")
    
    // MARK: - 初めにデータを持ってくる処理
    func readCoreData() -> () {
        do {
            //配列にcoreDataの情報を格納する
            //TodoList型にダウンキャスト
            todoListArray = try managedOfContext.fetch(conditions) as! [TodoList]
        } catch {
            print("error in readCoreData")
        }
        let newTodoList = TodoList(context: self.managedOfContext)
        
    }
    
    // MARK: - coreDataへの保存
    func addTodoList(todoListName: String, todoListDate: Date, todoListPoint: Int) {
        let newTodoList = TodoList(context: self.managedOfContext)
        
        //各々の要素を格納する
        newTodoList.name = todoListName
        newTodoList.date = todoListDate
        newTodoList.point = Int16(todoListPoint)
        
        //情報の上書き
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
    }
    
    // MARK: - coreDataの情報を削除
    func allClerCoreData() {
        //coreDataからの削除処理
        if let coreDataCount = coreDataCount {
            for coreDataCount in 0..<coreDataCount {
            managedOfContext.delete(todoListArray[coreDataCount])
        }
            //配列からの削除処理
            todoListArray.removeAll()
            //coreDataに新しい情報を保存する
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        }
    }
    
    // MARK: - coreDataの特定の情報を削除
    func clerCoreData(clerListNumber: Int) {
        //coreDataの該当箇所のdataを削除する
        managedOfContext.delete(todoListArray[clerListNumber])
        //配列からの削除処理
        todoListArray.remove(at: clerListNumber)
        //coreDataに新しい情報を保存する
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    

   
    
    
}
