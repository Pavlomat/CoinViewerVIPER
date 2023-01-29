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
    
    //    let defaults = UserDefaults.standard
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
    //    }
    
//    @objc private func logoutButtonTapped() {
//        defaults.set(false, forKey: "UserLogged")
//        self.navigationController?.popToRootViewController(animated: true)
//    }
    
}


extension CoinDetailViewController: PresenterToViewCoinDetailProtocol {
  
    func onGetCoinSuccess(for coin: DataClass) {
        print("View receives the response from Presenter and updates itself.")
        nameLabel.text = coin.symbol
        priceLabel.text = String(coin.marketData!.priceUsd ?? 0.0)
        changeLabel.text = String(coin.marketData!.percentChangeUsdLast1_Hour ?? 0.0)
    }
    
    func onGetCoinFailure() {
        print("View receives the response from Presenter and updates itself.")
        self.navigationItem.title = "Failure"
    }
    
}

// MARK: - UI Setup
extension CoinDetailViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
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

