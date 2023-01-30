//
//  CoinsViewController.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class CoinsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
        sortTableView()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
    }
    
    // MARK: - Actions
    func sortTableView() {
        let ascendingSort = UIAction(title: "Ascending", image: UIImage(systemName: "arrow.up.square")) { [weak self] (action) in
            self?.presenter?.sortTableViewAscending()
        }
        
        let descendingSort = UIAction(title: "Descending", image: UIImage(systemName: "arrow.down.app")) { [weak self] (action) in
            self?.presenter?.sortTableViewDescending()
        }
        
        let menu = UIMenu(title: "Sort by price USD", options: .displayInline, children: [ascendingSort , descendingSort])
        let navItems = [UIBarButtonItem(title: "Sort", image: nil, menu: menu)]
        self.navigationItem.rightBarButtonItems = navItems
    }
    
    @objc func logoutButtonTapped() {
        presenter?.logoutButtonTapped()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterCoinsProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
       let activityIndicator = UIActivityIndicatorView()
       activityIndicator.style = .large
       activityIndicator.translatesAutoresizingMaskIntoConstraints = false
       activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .black
       activityIndicator.startAnimating()
       return activityIndicator
   }()
}

extension CoinsViewController: PresenterToViewCoinsProtocol {
    func onFetchCoinsSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.activityIndicator.stopAnimating()
        }
    }
    
    func onFetchCoinsFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
    }
    
    func deselectRowAt(row: Int) {
        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    }
    
}

// MARK: - UITableView Delegate & Data Source
extension CoinsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else {
            fatalError()
        }
        guard let coin = presenter?.textLabelText(indexPath: indexPath) else { return cell }
        
        cell.nameLabel.text = coin.symbol
        
        if let price = coin.marketData!.priceUsd {
            cell.priceLabel.text = String(price)
        } else {
            cell.priceLabel.text = "No data"
        }
        
        if let change = coin.marketData!.percentChangeUsdLast1_Hour {
            cell.changeLabel.text = String(change)
        } else {
            cell.changeLabel.text = "No data"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        presenter?.deselectRowAt(index: indexPath.row)
    }
}

// MARK: - UI Setup
extension CoinsViewController {
    func setupUI() {
//        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)
        self.view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.navigationItem.title = "Coins"
    }
}

