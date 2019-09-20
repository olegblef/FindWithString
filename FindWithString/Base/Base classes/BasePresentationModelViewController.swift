//
//  BasePresentationModelViewController.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class BasePresentationModelViewController<Model: PresentationModelProtocol, View: StandartView>: BaseViewController<View>, Renderable where Model.ViewData == View.ViewData {
    
    // MARK: - Typealiases
    
    typealias ViewData = Model.ViewData
    
    // MARK: - Internal properties
    
    let model: Model
    
    var viewData: ViewData {
        didSet {
            self.view.setNeedsLayout()
        }
    }
    
    // MARK: - Initializations and Deallocations
    
    init(model: Model) {
        self.model = model
        self.viewData = model.data.value
        super.init(nibName: nil, bundle: nil)
        self.observeModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.render(viewData: self.viewData)
    }
    
      // MARK - Private methods
    
    private func observeModel() {
        self.model.data
            .producer
            .take(during: self.reactive.lifetime)
            .observe(on: QueueScheduler.main)
            .startWithValues { [weak self] viewData in
                self?.viewData = viewData
        }
    }
    
    // MARK: - Renderable
    
    func render(viewData: Model.ViewData) {
        self.rootView?.render(viewData: self.viewData)
    }
}

