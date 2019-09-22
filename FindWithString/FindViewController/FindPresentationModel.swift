//
//  FindPresentationModel.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation
import ReactiveSwift

final class FindPresentationModel: BasePresentationModel<FindViewData>,
                                   FindPresentationModelProtocol,
                                   Cashable {
    
    // MARK: - Private properties
    
    private var store: SharedCashRealmService
    
    private let (lifetime, token) = Lifetime.make()

    private let findText = MutableProperty<String?>(nil)
    
    private let cashArray = MutableProperty<[SharedCashRealm]?>([])
    
    // MARK: - Initializations and Deallocations
    
    init(_ store: SharedCashRealmService) {
        let dataInternal = MutableProperty<FindViewData>(FindViewData.initial)
        self.store = store
        super.init(dataInternal: dataInternal)
        self.setupData()
        self.startFeeling()
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
        self.saveRequest(SharedCash(pathString: value.pathString, text: value.text))
        self.cashArray.value?.append(value)
        self.findText.value = nil
    }
    
    private func saveRequest(_ request: SharedCash) {
        self.store.create(cash: SharedCashRealm(cash: request))
    }
    
    private func startFeeling() {
        self.store.get()?.forEach {
            print($0.text)
            self.cashArray.value?.append($0)
        }
    }
}

