//
//  ImageDataProvider.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

final class ImageDataProvider {
    
    // MARK: - Static properties
    
    static let shared = ImageDataProvider()
    
    // MARK: - Initializations and Deallocations
    
    private init() {}
    
    // MARK: - Private properties
    
    private lazy var session = URLSession(configuration: .default)
    private let realmManager = SharedCashRealmService()
    private let cache = ImageCache()
    
    // MARK: - Internal methods
    
    func load(urlString: String, handler: @escaping ((UIImage) -> Void)) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global(qos: .utility).async {
            if let cachedImage = self.cache.image(for: url) {
                handler(cachedImage)
                return
            }
            
            self.session.downloadTask(with: url) { [weak self] _, _, _ in
                    self?.download(urlResponse: url, handler: handler) }
                    .resume()
            }
    }
    
      // MARK - Private methods
    
    private func download(urlResponse: URL?, handler: @escaping ((UIImage) -> Void)) {
        let manager = self.realmManager
        let urlResponse = toString(urlResponse!)
        guard let url = URL(string: urlResponse) else { return }
       
        manager.get()?.forEach {
            if urlResponse == $0.pathString {
                let image = imageFromString(urlResponse)
                self.cache.store(image: image, for: url)
                handler(image)
            }
        }
    }
}
