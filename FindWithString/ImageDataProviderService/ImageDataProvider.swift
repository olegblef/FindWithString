//
//  ImageDataProvider.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

final class ImageDataProvider {
    
    static let shared = ImageDataProvider()
    
    private init() {}
    
    private lazy var session = URLSession(configuration: .default)
    private let fileManager = FileManager()
    private let cache = ImageCache()
    
    func load(url: URL, handler: @escaping ((CGImage) -> Void)) {
        DispatchQueue.global(qos: .utility).async {
            if let cachedImage = self.cache.image(for: url) {
                handler(cachedImage)
                return
            }
            
            self.session.downloadTask(with: url) { [weak self] locationUrl, response, error in
                self?.handleDownload(response: response, locationUrl: locationUrl, handler: handler) }
                .resume()
        }
    }
    
    private func handleDownload(response: URLResponse?, locationUrl: URL?, handler: @escaping ((CGImage) -> Void)) {
        guard
            let responseUrl = response?.url,
            let locationUrl = locationUrl
            else { return }
        
        do {
            let directory = try
                self.fileManager.url(for: .documentDirectory,
                                     in: .userDomainMask,
                                     appropriateFor: nil,
                                     create: true)
                    .appendingPathComponent(locationUrl.lastPathComponent)
            
            try self.fileManager.copyItem(at: locationUrl, to: directory)
            
            guard
                let imageSource = CGImageSourceCreateWithURL(directory as NSURL, nil),
                let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
                else { print(#function, "couldn't load or create image source in \(directory)"); return }
            
            self.cache.store(image: image, for: responseUrl)
            handler(image)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

final class ImageCache {
    private let cache = NSCache<NSURL, CGImage>()
    private let queue = DispatchQueue(label: "imageCacheQueue", qos: .utility)
    
    func store(image: CGImage, for url: URL) {
        self.queue.async { [weak self] in
            self?.cache.setObject(image, forKey: url as NSURL)
        }
    }
    
    func image(for url: URL) -> CGImage? {
        return self.cache.object(forKey: url as NSURL)
    }
}
