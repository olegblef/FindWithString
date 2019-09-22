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
    let id: String
    let createdAt, updatedAt: Date
    let width, height: Int
    let color: String
    let resultDescription: String?
    let altDescription: String
    let urls: Urls
    let links: ResultLinks
    let categories: [JSONAny]
    let likes: Int
    let likedByUser: Bool
    let currentUserCollections: [JSONAny]
    let user: User
    let tags: [Tag]
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case resultDescription = "description"
        case altDescription = "alt_description"
        case urls, links, categories, likes
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
        case user, tags
    }
}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    let linksSelf, html, download, downloadLocation: String
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Tag
struct Tag: Codable {
    let type: TypeEnum
    let title: TagTitle
    let source: Source?
}

// MARK: - Source
struct Source: Codable {
    let ancestry: Ancestry
    let title: SourceTitle
    let subtitle: Subtitle
    let sourceDescription: String
    let metaTitle: MetaTitle
    let metaDescription: String
    let coverPhoto: CoverPhoto
    
    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle
        case sourceDescription = "description"
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct Ancestry: Codable {
    let type, category: Category
    let subcategory: Category?
}

// MARK: - Category
struct Category: Codable {
    let slug: Slug
    let prettySlug: PrettySlug
    
    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

enum PrettySlug: String, Codable {
    case animals = "Animals"
    case butterfly = "Butterfly"
    case cat = "Cat"
    case images = "Images"
}

enum Slug: String, Codable {
    case animals = "animals"
    case butterfly = "butterfly"
    case cat = "cat"
    case images = "images"
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable {
    let id: ID
    let createdAt, updatedAt: Date
    let width, height: Int
    let color: Color
    let coverPhotoDescription: String?
    let altDescription: AltDescription
    let urls: Urls
    let links: ResultLinks
    let categories: [JSONAny]
    let likes: Int
    let likedByUser: Bool
    let currentUserCollections: [JSONAny]
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case coverPhotoDescription = "description"
        case altDescription = "alt_description"
        case urls, links, categories, likes
        case likedByUser = "liked_by_user"
        case currentUserCollections = "current_user_collections"
        case user
    }
}

enum AltDescription: String, Codable {
    case brownScottishFoldInBrownThickPileBlanket = "brown Scottish fold in brown thick-pile blanket"
    case grayTabbyCatInYellowAndBlackHandCaseBackpack = "gray tabby cat in yellow and black hand-case backpack"
    case redAndMulticoloredButterflyPerchOnYellowPetaledFlower = "red and multicolored butterfly perch on yellow petaled flower"
}

enum Color: String, Codable {
    case the080606 = "#080606"
    case the0E0807 = "#0E0807"
    case the342C3B = "#342C3B"
}

enum ID: String, Codable {
    case cvs4KWJaYLs = "CVS4kWJaYLs"
    case f8JYQPq45UI = "f8JYQPq45uI"
    case nodtnCSLdTE = "NodtnCsLdTE"
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}

// MARK: - User
struct User: Codable {
    let id: String
    let updatedAt: Date
    let username, name, firstName: String
    let lastName: String?
    let twitterUsername: TwitterUsername?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String
    let portfolio, following, followers: String
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String
}

enum TwitterUsername: String, Codable {
    case jonasvincentbe = "jonasvincentbe"
    case mikleVasilyev = "MikleVasilyev"
    case yerlinmatu = "yerlinmatu"
}

enum MetaTitle: String, Codable {
    case the900AnimalsImagesDownloadHDPicturesPhotosOnUnsplash = "900+ Animals Images: Download HD Pictures & Photos on Unsplash"
    case the900ButterflyImagesDownloadHDPicturesPhotosOnUnsplash = "900+ Butterfly Images: Download HD Pictures & Photos on Unsplash"
    case the900CatImagesDownloadHDPicturesPhotosOnUnsplash = "900+ Cat Images: Download HD Pictures & Photos on Unsplash"
}

enum Subtitle: String, Codable {
    case downloadFreeAnimalsImages = "Download free animals images"
    case downloadFreeButterflyImages = "Download free butterfly images"
    case downloadFreeCatImages = "Download free cat images"
}

enum SourceTitle: String, Codable {
    case animalsImages = "Animals Images"
    case butterflyImages = "Butterfly Images"
    case catImages = "Cat Images"
}

enum TagTitle: String, Codable {
    case animal = "animal"
    case butterfly = "butterfly"
    case cat = "cat"
    case mammal = "mammal"
    case pet = "pet"
}

enum TypeEnum: String, Codable {
    case landingPage = "landing_page"
    case search = "search"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
