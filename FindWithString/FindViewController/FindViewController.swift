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
import Foundation

final class FindViewController<Model: FindPresentationModelProtocol>:
                                BasePresentationModelViewController<Model, FindView>,
                                UITableViewDelegate,
                                UITableViewDataSource,
                                UITextFieldDelegate,
                                Cashable {
    
    // MARK: - Private properties
    
    private let service = APIService()
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
    }
    
    // MARK - Private methods
    
    private func configUI() {
        self.rootView?.tableView.delegate = self
        self.rootView?.tableView.dataSource = self
        self.rootView?.findTextField.delegate = self
        
        self.rootView?.tableView.register(FindTableViewCell.self, forCellReuseIdentifier: toString(FindTableViewCell.self))
        
        self.rootView?.findTextField.reactive.continuousTextValues.observeValues { [weak self] text in
            self?.viewData.onUpdateFindText?(text)
        }
    }
    
    private func getAlert() {
        let alertController = UIAlertController(title: "Sorry", message: "We don't have this image", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.cashArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: toString(FindTableViewCell.self), for: indexPath) as? FindTableViewCell
        let item = self.viewData.cashArray?[indexPath.row]
        item.do {
            cell?.render(viewData: $0)
        }
        return cell ?? UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.rootView?.findTextField {
            textField.text.do { [weak self] text in
                self?.service.getImage(text: text,
                                 completion: {
                                    self?.viewData.addCash?(SharedCashRealm(cash: SharedCash(pathString: $0, text: text)))
                                    textField.resignFirstResponder()
                },
                                 alert: {
                                    self?.getAlert()
                })
            }
        }
        return true
    }
}
