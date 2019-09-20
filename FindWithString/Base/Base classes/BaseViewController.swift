//
//  BaseViewController.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

class BaseViewController<View: UIView>: UIViewController, RootViewGettable {
    
    typealias RootViewType = View
    
    override func loadView() {
        view = View(frame: UIScreen.main.bounds)
    }
}
