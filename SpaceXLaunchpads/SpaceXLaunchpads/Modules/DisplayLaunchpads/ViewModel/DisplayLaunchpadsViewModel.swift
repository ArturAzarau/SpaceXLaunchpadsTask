//
//  DisplayLaunchpadsViewModel.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import PromiseKit
import Bond
import ReactiveKit

final class DisplayLaunchpadsViewModel<NetworkServiceType: NetworkFetchingService, MapperType: ObjectsMapper, ModelType, CellMakerType: CellMaker>
where MapperType.ObjectType == ModelType, CellMakerType.ModelType == ModelType {
    
    private let networkService: NetworkServiceType
    private let cellMaker: CellMakerType
    private let models = Observable<[ModelType]>([])
    
    private let disposeBag = DisposeBag()
    private let errorSubject = Subject<Error, Never>()
    
    func observeErrors(with action: @escaping (Error) -> ()) {
        errorSubject.observeNext { error in
            action(error)
        }
        .dispose(in: disposeBag)
    }
    
    init(networkService: NetworkServiceType, cellMaker: CellMakerType) {
        self.networkService = networkService
        self.cellMaker = cellMaker
    }
    
    func bind(tableView: UITableView) {
        models.bind(to: tableView, using: cellMaker.createCell()).dispose(in: disposeBag)
    }
    
    func fetchData() {
        firstly {
            try networkService.fetchData()
        }.compactMap(on: .global(qos: .utility), flags: nil) { data, _  -> [ModelType]? in
            let mapper = MapperType()
            return try? mapper.mapObjects(from: data)
        }.done { [weak models] newModels in
            models?.on(.next(newModels))
        }.catch { [weak errorSubject] error in
            errorSubject?.on(.next(error))
        }
    }
}
