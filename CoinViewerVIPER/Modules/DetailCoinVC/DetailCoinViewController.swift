//
//  DetailCoinViewController.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class CoinDetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterCoinDetailProtocol?
    
    let nameLabel = UILabel.createLabel(font: .headline)
    let priceLabel = UILabel.createLabel(font: .body)
    let changeLabel = UILabel.createLabel(font: .body)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, changeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Actions
    @objc func logoutButtonTapped() {
        presenter?.logoutButtonTapped()
    }
    
}


extension CoinDetailViewController: PresenterToViewCoinDetailProtocol {
  
    func onGetCoinSuccess(for coin: CoinData) {
        nameLabel.text = coin.symbol
        
        if let price = coin.marketData!.priceUsd {
            priceLabel.text = String(format: "%.3f", price)
        } else {
            priceLabel.text = "No data"
        }
        
        if let change = coin.marketData!.percentChangeUsdLast1_Hour {
            changeLabel.text = String(format: "%.3f", change)
        } else {
            changeLabel.text = "No data"
        }
    }
    
    func onGetCoinFailure() {
        self.navigationItem.title = "Failure"
    }
    
}

// MARK: - UI Setup
extension CoinDetailViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: margins.widthAnchor)
        ])
    }
}

