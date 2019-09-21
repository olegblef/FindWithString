//
//  FindViewData.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

struct FindViewData: BaseViewData, Cashable {
    
    let findText: String?
    let cashArray: [Cash]?
    let onUpdateFindText: ((String) -> ())?
    let addCash: ((Cash) -> ())?
    
    static var initial: FindViewData {
        return FindViewData(findText: nil,
                            cashArray: nil,
                            onUpdateFindText: nil,
                            addCash: nil)
    }
}
