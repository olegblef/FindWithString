//
//  cast.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation

public func cast<Type, Result>(_ value: Type) -> Result? {
    return value as? Result
}
