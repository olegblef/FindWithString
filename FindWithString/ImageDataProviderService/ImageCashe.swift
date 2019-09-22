//
//  ImageCashe.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

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
