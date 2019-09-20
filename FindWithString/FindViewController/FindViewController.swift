//
//  ViewController.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

final class FindViewController<Model: FindPresentationModelProtocol>:
                                BasePresentationModelViewController<Model, FindView>,
                                UITableViewDelegate,
                                UITableViewDataSource {

    // MARK: - Typealiases
    
    typealias Cash = (UIImage, String)
    
    // MARK: - Private properties
    
    private var filling = [(UIImage(named: "cat"), "cat"), (UIImage(named: "cat"), "cat")]
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
    }
    
    // MARK - Private methods
    
    private func configUI() {
        self.rootView?.tableView.delegate = self
        self.rootView?.tableView.dataSource = self
        self.rootView?.tableView.register(FindTableViewCell.self, forCellReuseIdentifier: toString(FindTableViewCell.self))
        
        self.rootView?.findTextField.reactive.continuousTextValues.observeValues { [weak self] text in
            self?.viewData.onUpdateFindText?(text)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filling.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: toString(FindTableViewCell.self), for: indexPath) as! FindTableViewCell
        let item = self.filling[indexPath.row]
        cell.render(viewData: item as! FindTableViewCell.State)
        return cell
    }
}

