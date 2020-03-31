//
//  PromiseKitNetworkService.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import PromiseKit
import ObjectMapper

final class PromiseKitNetworkService {
    
    private let stringURL: String
    
    init(stringURL: String) {
        self.stringURL =  stringURL
    }
}

extension PromiseKitNetworkService: DataFetchingService {
    func fetchData() throws -> Promise<(data: Data, response: URLResponse)> {
        guard let url = URL(string: stringURL) else {
            throw NetworkServiceError.invalidURL
        }
        
        return URLSession.shared.dataTask(.promise, with: url)
    }
}
