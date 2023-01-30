//
//  TableHeader.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 30.01.2023.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    
    static let identifier = "TableHeader"
    
    let nameLabel = UILabel.createLabel(font: .headline)
    let priceLabel = UILabel.createLabel(font: .headline)
    let changeLabel = UILabel.createLabel(font: .headline)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, changeLabel])
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        nameLabel.text = "Name"
        priceLabel.text = "Price USD"
        changeLabel.text = "Change %"
        
        contentView.addSubview(stackView)
        
        let margins = contentView.readableContentGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
}
