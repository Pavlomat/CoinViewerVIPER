//
//  TableViewCell.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let nameLabel = UILabel.createLabel(font: .body)
    let priceLabel = UILabel.createLabel(font: .body)
    let changeLabel = UILabel.createLabel(font: .body)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, changeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(stackView)

        let margins = contentView.readableContentGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
    
    var model: CoinData? {
        didSet {
            guard let model = model else {
                return
            }
            
            self.nameLabel.text = model.symbol
            self.priceLabel.text = model.checkData(from: model.marketData!.priceUsd)
            self.changeLabel.text = model.checkData(from: model.marketData!.percentChangeUsdLast1_Hour)
        }
    }
}



