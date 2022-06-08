//
//  RealmService.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation
import Realm
import RealmSwift

protocol PersistenceSerivce {
    func write(data: ArticleList)
    func retrieve() -> ArticleList?
}

final class RealmService: PersistenceSerivce {
    
    let realm = try! Realm()
    
    //MARK: - Data Actions
    
    func write(data: ArticleList) {
        if realm.object(ofType: ArticleList.self, forPrimaryKey: data.id) == nil {
            try! realm.write {
                realm.add(data)
            }
        }
    }
    
    func retrieve() -> ArticleList? {
        return realm.objects(ArticleList.self).first
    }
    
    
}
