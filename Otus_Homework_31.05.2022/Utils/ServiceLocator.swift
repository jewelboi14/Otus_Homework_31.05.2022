//
//  ServiceLocator.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import Foundation
protocol ServiceLocatorProtocol {
    func getService<T>() -> T?
}

final class ServiceLocator<T>: ServiceLocatorProtocol {

    //MARK: - Properties
    
    private lazy var reg: Dictionary<String, Any> = [:]

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
    
    //MARK: - Service Actions

    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        reg[key] = service
        print("Service added: \(key) / \(typeName(some: service))")
    }

    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        return reg[key] as? T
    }

}
