//
//  FindTableViewCell.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/21/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell, Renderable, Cashable {
    
    // MARK: - Typealiases
    
    typealias ViewData = Cash

    // MARK: - Internal properties

    let label = PaddingLabel(top: 0, bottom: 0, left: 10, right: 20)
    let photo = UIImageView()
    let line = UIView()

//    var textString: String = "" {
//        willSet {
//            self.label.text = newValue
//        }
//    }
    
    // MARK: - Private properties

//    private var state: State?
    
    private let offset: CGFloat = 10
    private let photoSize: CGFloat = 80
    private let labelHeight: CGFloat = 40
    private let lineHeight: CGFloat = 1
    
    private let labelTextColor: UIColor = .black
    private let lineColor: UIColor = .darkGray
    
    // MARK: - Initializations and Deallocations

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    // MARK: - Private methods

    private func setupUI() {
        let label = self.label
        let photo = self.photo
        let line = self.line
        let contentView = self.contentView

        [label, photo, line].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.heightAnchor.constraint(equalToConstant: self.photoSize),
            photo.widthAnchor.constraint(equalToConstant: self.photoSize),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (self.photoSize - self.labelHeight) / 2),
            label.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: self.offset),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: self.labelHeight),
            line.heightAnchor.constraint(equalToConstant: self.lineHeight),
            line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])

        photo.setContentHuggingPriority(UILayoutPriority(749), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
        
        self.setupLabel()
        self.setupPhoto()
        self.setupLine()
        self.layoutIfNeeded()
    }
    
    private func setupLabel() {
        let label = self.label
        
        label.textAlignment = .left
        label.textColor = self.labelTextColor
    }
    
    private func setupPhoto() {
    
    }
    
    private func setupLine() {
        let line = self.line
        
        line.backgroundColor = self.lineColor
    }

    // MARK: - Renderable

    func render(viewData state: Cash) {
        self.label.text = state.1
        self.photo.image = state.0
//        self.state = state
    }
}
