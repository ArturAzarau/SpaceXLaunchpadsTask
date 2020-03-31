//
//  NetworkFetchingService.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import PromiseKit

protocol DataFetchingService: class {
    
    func fetchData() throws -> Promise<(data: Data, response: URLResponse)>
}

