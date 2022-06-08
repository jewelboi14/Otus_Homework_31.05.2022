//
//  NetworkService.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation

protocol NetworkService {
    func fetchArticleList(completion: @escaping (ArticleList) -> Void)
}

class ArticleListNetworkService: NetworkService {
    
    func fetchArticleList(completion: @escaping (ArticleList) -> Void) {
        guard let url = URL(string: APIHelper.shared.getArticlesForTesla()) else { return }
        print(APIHelper.shared.getArticlesForTesla())
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(ArticleList.self, from: data)
                print(decodedData)
                completion(decodedData)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}
