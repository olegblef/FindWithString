//
//  SharedInfoRealm.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class SharedInfoRealm: Object {
    dynamic var image: UIImage = UIImage()
    dynamic var text: String = ""
    
    convenience init(info: SharedInfo) {
        self.init()
        self.image = info.image
        self.text = info.text
    }
}
