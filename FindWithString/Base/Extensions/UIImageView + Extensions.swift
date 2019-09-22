//
//  UIImageView + Extensions.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/23/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(_ string: String) {
        ImageDataProvider.shared.load(urlString: string) { [weak self] cg in
            DispatchQueue.main.async {
                self?.image = cg
            }
        }
    }
}
