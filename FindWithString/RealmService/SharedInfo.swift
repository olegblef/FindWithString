//
//  SharedInfo.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

class SharedInfo: Equatable {
    
    // MARK: - Internal properties
    
    var image: UIImage = UIImage()
    var text: String = ""
    
    // MARK: - Initializations and Deallocations
    
    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
    }
    
    // MARK: - Static methods
    
    static func == (lhs: SharedInfo, rhs: SharedInfo) -> Bool {
        if lhs.image == rhs.image && lhs.text == rhs.text {
            return true
        } else {
            return false
        }
    }
}
