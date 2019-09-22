//
//  SharedInfo.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

class SharedCash: Equatable {
    
    // MARK: - Internal properties
    
    var pathString: String = ""
    var text: String = ""
    
    // MARK: - Initializations and Deallocations
    
    init(pathString: String, text: String) {
        self.pathString = pathString
        self.text = text
    }
    
    // MARK: - Static methods
    
    static func == (lhs: SharedCash, rhs: SharedCash) -> Bool {
        if lhs.pathString == rhs.pathString && lhs.text == rhs.text {
            return true
        } else {
            return false
        }
    }
}
