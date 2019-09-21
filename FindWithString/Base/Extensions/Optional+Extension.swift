//
//  Optional + Extension.swift
//  TestLoginization
//
//  Created by Oleh Blef on 5/27/19.
//  Copyright © 2019 Oleg Podluzhnyi. All rights reserved.
//

import Foundation

extension Optional {
    
    public func `do`(_ closure: (Wrapped) -> ()) {
        self.map(closure)
    }
}
