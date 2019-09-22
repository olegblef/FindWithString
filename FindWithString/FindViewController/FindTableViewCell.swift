//
//  FindTableViewCell.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/21/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell, Renderable, Cashable {

    // MARK: - Private properties

    private let titleLabel = PaddingLabel(top: 0, bottom: 0, left: 10, right: 20)
    private let photoImageView = UIImageView()
    private let line = UIView()
    
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
        let label = self.titleLabel
        let photo = self.photoImageView
        let line = self.line
        let contentView = self.contentView

        [label, photo, line].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: self.photoSize + self.lineHeight),
            line.heightAnchor.constraint(equalToConstant: self.lineHeight),
            line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.heightAnchor.constraint(equalToConstant: self.photoSize),
            photo.widthAnchor.constraint(equalToConstant: self.photoSize),
            photo.bottomAnchor.constraint(equalTo: line.topAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (self.photoSize - self.labelHeight) / 2),
            label.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: self.offset),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: self.labelHeight)
            ])

        photo.setContentHuggingPriority(UILayoutPriority(749), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
        
        self.setupLabel()
        self.setupLine()
    }
    
    private func setupLabel() {
        let label = self.titleLabel
        
        label.textAlignment = .left
        label.textColor = self.labelTextColor
    }
    
    private func setupLine() {
        let line = self.line
        
        line.backgroundColor = self.lineColor
    }

    // MARK: - Renderable

    func render(viewData state: Cash) {
        self.titleLabel.text = state.text
        self.photoImageView.load(state.pathString)
    }
}
