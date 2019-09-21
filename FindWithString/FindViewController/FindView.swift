//
//  FindView.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

final class FindView: ViewDataGettable<FindPresentationModel>, StandartView {
  
    // MARK - Internal properties
    
    let findTextField = PaddingTextField(inset: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
    let tableView = UITableView()
    
    // MARK: - Private properties
    
    private let textFieldsHeight: CGFloat = 40
    
    private let textFieldsBackColor: UIColor = .darkGray
    private let textColor: UIColor = .white
    private let backColor: UIColor = .lightGray
    
    // MARK: - Initializations and Deallocations
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Override methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Renderable
    
    func render(viewData: ViewData) {
        self.findTextField.text = viewData.findText
        self.tableView.reloadData()
    }
    
      // MARK - Private methods
    
    private func setupUI() {
        let findTextField = self.findTextField
        let tableView = self.tableView
        
        [findTextField, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)

            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
                ])
        }
        
        NSLayoutConstraint.activate([
            findTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            findTextField.heightAnchor.constraint(equalToConstant: self.textFieldsHeight),
            tableView.topAnchor.constraint(equalTo: findTextField.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        self.backgroundColor = self.backColor
        self.setupTextField()
        self.setupTableView()
    }
    
    private func setupTextField() {
        let findTextField = self.findTextField
        
        findTextField.backgroundColor = self.textFieldsBackColor
        findTextField.textColor = self.textColor
        findTextField.tintColor = self.textColor
        
        findTextField.returnKeyType = .done
    }
    
    private func setupTableView() {
        let tableView = self.tableView
        
        tableView.separatorStyle = .none
    }
}
