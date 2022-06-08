//
//  APIHelper.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation

final class APIHelper {
    
    static let shared = APIHelper()
    
    private let APIKey = "8ec5b28f7aca433bbea6ec7f32e584f2"
    private let baseURL = "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey="
    
    func getArticlesForTesla() -> String {
        return baseURL + APIKey
    }
    
}

