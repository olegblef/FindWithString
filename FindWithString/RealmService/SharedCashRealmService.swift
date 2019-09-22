//
//  SharedInfoRealmService.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation
import RealmSwift

class SharedCashRealmService {
    
    // MARK: - Private properties
    
    private let realmService = RealmService()
    
    // MARK: - Public methods
    
    public func create(cash: SharedCashRealm) {
        self.realmService.create(cash)
    }
    
    public func update(object: SharedCashRealm, dict: [String: String?]) {
        self.realmService.update(object, with: dict)
    }
    
    public func delete(object: SharedCashRealm) {
        self.realmService.delete(object)
    }
    
    public func get() -> Results<SharedCashRealm>? {
        return self.realmService.get()
    }
}
