//
//  PaddingTextField.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

class PaddingTextField : UITextField {
    
    // MARK: - Private properties
    
    private var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    // MARK: - Initializations and Deallocations
    
    init(inset: UIEdgeInsets) {
        self.padding = inset
        
        super.init(frame: CGRect())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Override methods
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
