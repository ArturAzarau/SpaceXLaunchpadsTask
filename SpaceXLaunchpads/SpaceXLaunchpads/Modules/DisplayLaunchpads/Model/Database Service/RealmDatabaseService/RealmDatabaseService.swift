//
//  RealmDatabaseService.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import RealmSwift

final class RealmDatabaseService {
    
    private let realm: Realm
    
    init() {
        realm = try! Realm()
    }
}

extension RealmDatabaseService: DatabaseService {
    func fetchData() -> [RealmLaunchpad] {
        return Array(realm.objects(RealmLaunchpad.self))
    }
    
    func write(data: [RealmLaunchpad]) throws {
        try realm.write {
            realm.add(data)
        }
    }
    
    func deleteAll() throws {
        try realm.write {
            realm.deleteAll()
        }
    }
}

extension RealmDatabaseService: BackgroundWritingDatabaseService {
    func writeDataInBackground(data: [Launchpad]) {
        let worker = RealmThreadWorker()
        worker.writeDataInBackground(data: data)
    }
}
