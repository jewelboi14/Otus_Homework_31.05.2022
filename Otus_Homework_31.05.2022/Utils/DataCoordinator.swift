//
//  DataCoordinator.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation

final class DataCoordinator {
    
    //MARK: - Properties
    
    private let serviceLocator: ServiceLocatorProtocol = {
        let sl = ServiceLocator<Any>()
        sl.addService(service: ArticleListNetworkService() as NetworkService)
        sl.addService(service: RealmService() as PersistenceSerivce)
        return sl
    }()
    
    private var networkSerivce: NetworkService?
    private var persistenceService: PersistenceSerivce?
    
    //MARK: - Lifecycle
    
    init() {
        networkSerivce = serviceLocator.getService()
        persistenceService = serviceLocator.getService()
    }
    
    //MARK: - Fetch Methods
    
    func getArticleList(completion: @escaping (ArticleList) -> Void) {
        
        if let persistenceService = persistenceService {
            if let articleList = persistenceService.retrieve() {
                DispatchQueue.main.async {
                    completion(articleList)
                }
            } else {
                networkSerivce?.fetchArticleList(completion: { [weak self] articleList in
                    DispatchQueue.main.async {
                        self?.persistenceService?.write(data: articleList)
                        completion(articleList)
                    }
                })
            }
        }
    }
}
