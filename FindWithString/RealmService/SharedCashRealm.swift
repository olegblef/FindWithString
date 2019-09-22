//
//  SharedInfoRealm.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class SharedCashRealm: Object {
    
    // MARK: - Dynamic properties
    
    dynamic var pathString: String = ""
    dynamic var text: String = ""
    
    // MARK: - Initializations and Deallocations
    
    convenience init(cash: SharedCash) {
        self.init()
        self.pathString = cash.pathString
        self.text = cash.text
    }
}
