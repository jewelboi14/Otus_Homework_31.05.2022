//
//  ArticleList.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation
import Realm
import RealmSwift

class ArticleList: Object, Decodable {
    
    @objc dynamic var id = UUID()
    var articleList = List<Article>()
    
    private enum CodingKeys: String, CodingKey {
        case articleList = "articles"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    public required convenience init(from decoder: Decoder) throws {
            self.init()
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let articles = try container.decodeIfPresent([Article].self, forKey: .articleList) ?? [Article()]
            articleList.append(objectsIn: articles)
        }
}
