//
//  Storage.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation

final class Storage {
    
    // MARK: - Private properties
    
    private var images = [SharedCash]()
    private let queue = DispatchQueue(label: "storage", qos: .background)
    
    // MARK: - Public methods
    
    public func add(_ image: SharedCash) {
        self.images.append(image)
    }
    
    public func delete(_ image: SharedCash) {
        self.queue.async() {
            let acc = self.images
            for (index, info) in acc.enumerated() {
                if info == image {
                    self.images.remove(at: index)
                }
            }
        }
    }
    
    public func get() -> [SharedCash] {
        var result: [SharedCash] = []
        self.queue.sync { result =  self.images }
        return result
    }
}
