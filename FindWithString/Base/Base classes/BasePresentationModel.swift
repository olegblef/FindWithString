//
//  BasePresentationModel.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation
import ReactiveSwift

class BasePresentationModel<Data: BaseViewData>: PresentationModelProtocol {
    
    // MARK: - Typealiases
    
    typealias ViewData = Data
    
    // MARK: - Internal properties
    
    var data: ReactiveSwift.Property<ViewData>
    
    let dataInternal: MutableProperty<ViewData>
    
    // MARK: - Initializations and Deallocations
    
    init(dataInternal: MutableProperty<ViewData>) {
        self.dataInternal = dataInternal
        self.data = Property(capturing: dataInternal)
    }
}
