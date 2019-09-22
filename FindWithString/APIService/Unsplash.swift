//
//  Unsplash.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation

// MARK: - Unsplash

struct Unsplash: Codable {
    let total, totalPages: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}
