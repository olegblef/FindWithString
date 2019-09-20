//
//  PresentationModelProtocol.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol PresentationModelProtocol {
    
    associatedtype ViewData
    
    var data: Property<ViewData> { get }
}
