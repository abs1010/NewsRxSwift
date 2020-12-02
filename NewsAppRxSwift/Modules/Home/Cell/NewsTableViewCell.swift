//
//  NewsTableViewCell.swift
//  NewsAppRxSwift
//
//  Created by Alan Silva on 01/12/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let cellID = "DetailCollectionViewCellID"
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var textDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(title)
        self.contentView.addSubview(textDescription)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 0),
            title.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
            title.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor, constant: 0),
            //title.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
            textDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            textDescription.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
            textDescription.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor, constant: 0),
            textDescription.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor, constant: 0)
        ])
        
    }
    
}
