//
//  Article.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation
import RealmSwift
import Realm

class Article: Object, Decodable {
    @objc dynamic var id = UUID()
    @objc dynamic var title: String?
    @objc dynamic var author: String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
    }
}
