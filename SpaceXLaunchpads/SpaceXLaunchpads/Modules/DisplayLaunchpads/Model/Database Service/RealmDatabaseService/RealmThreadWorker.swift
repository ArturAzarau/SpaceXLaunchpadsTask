//
//  RealmBackgroundWriter.swift
//  SpaceXLaunchpads
//
//  Created by Artur Azarau on 31.03.2020.
//  Copyright © 2020 arturazarau. All rights reserved.
//

import RealmSwift

final class RealmThreadWorker: NSObject, RealmBackgroundWriter {
    
    typealias ObjectToFillWith = Launchpad
    typealias Object = RealmLaunchpad
    
    private var writeRealm: Realm!
    private var thread: Thread!
    
    override init() {
        super.init()
        
        thread = Thread(target: self,
                        selector: #selector(threadWorker),
                        object: nil)
        thread.start()
    }
    
    func invalidate() {
        thread.cancel()
    }
    
    func writeDataInBackground(data: [Launchpad]) {
        perform(#selector(writeToDatabase(data:)),
                on: thread,
                with: data,
                waitUntilDone: false)
    }
    
    @objc private func writeToDatabase(data: [Launchpad]) {
        let realmObjects = data.map { launchpad -> RealmLaunchpad in
            let realmLaunchpad = RealmLaunchpad()
            realmLaunchpad.fillWith(value: launchpad)
            return realmLaunchpad
        }
        
        try! writeRealm.write {
            writeRealm?.deleteAll()
            writeRealm?.add(realmObjects)
        }
    }
    
    
    @objc private func threadWorker() {
        defer { Thread.exit() }
        writeRealm = try! Realm()
        
        while thread != nil, !thread.isCancelled {
            RunLoop.current.run(
                mode: RunLoop.Mode.default,
                before: Date.distantFuture)
        }
    }
}

