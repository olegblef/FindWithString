//
//  RootViewGettable.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

public protocol RootViewGettable {
    
    associatedtype RootViewType: UIView
    
    var rootView: RootViewType? { get }
}

public extension RootViewGettable where Self : UIViewController {

    var rootView: RootViewType? {
        return cast(self.viewIfLoaded)
    }
}
