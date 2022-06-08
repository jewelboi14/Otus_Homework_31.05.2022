//
//  ArticleListViewModel.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation

final class ArticleListViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var articleList: ArticleList? = nil
    
    private let dataCoordinator = DataCoordinator()
    
    //MARK: - Lifecycle
    
    func fetchArticleList() {
        dataCoordinator.getArticleList() { [weak self] articleList in
                self?.articleList = articleList
        }
    }
}
