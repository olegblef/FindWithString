//
//  FindViewData.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

struct FindViewData: BaseViewData {
    
    let findText: String?
    let onUpdateFindText: ((String) -> ())?
    let addCash: ((UIImage, String) -> ())?
    
    static var initial: FindViewData {
        return FindViewData(findText: nil,
                            onUpdateFindText: nil,
                            addCash: nil)
    }
}
