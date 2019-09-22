//
//  imageFromString.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

typealias ImageCompletion = ((UIImage) -> ())?

func imageFromString(_ requestUrl: String) -> UIImage {
    var result = UIImage()
    let finalUrl = URL(string: requestUrl)
    finalUrl.do {
        let imUrl: URL = $0
        if let data = try? Data(contentsOf: imUrl) {
            if let image = UIImage(data: data) {
                result = image
            }
        }
    }
    
    return result
}
