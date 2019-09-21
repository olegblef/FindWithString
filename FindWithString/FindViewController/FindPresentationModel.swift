//
//  FindPresentationModel.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation
import ReactiveSwift

final class FindPresentationModel: BasePresentationModel<FindViewData>, FindPresentationModelProtocol {

    // MARK: - Typealiases
    
    typealias Cash = (UIImage, String)
    
    // MARK: - Private properties
    
    private let (lifetime, token) = Lifetime.make()

    private let findText = MutableProperty<String?>(nil)
    
    private let cashArray = MutableProperty<[Cash]?>(nil)
    
    // MARK: - Initializations and Deallocations
    
    init() {
        let dataInternal = MutableProperty<FindViewData>(FindViewData.initial)
        super.init(dataInternal: dataInternal)
        self.setupData()
    }

    // MARK - Private methods

    private func setupData() {
        let signalProducer = SignalProducer.combineLatest(self.findText.producer,
                                                          self.cashArray.producer)

        signalProducer
            .take(during: self.lifetime)
            .observe(on: QueueScheduler.main)
            .startWithValues { [weak self] values in
                if let self = self {
                    let (findText, cashArray) = values
                    self.dataInternal.value = ViewData(findText: findText,
                                                       cashArray: cashArray,
                                                       onUpdateFindText: { [weak self] in
                                                        self?.findText.value = $0 },
                                                       addCash: { [weak self] in
                                                        self?.addCash($0) }
                    )
                }
        }
    }
    
    private func addCash(_ value: Cash) {
        self.cashArray.value?.append(value)
    }
}

