//
//  BaseViewController.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 145/255, green: 222/255, blue: 166/255, alpha: 0.5)

        setupView()
    }

    func setupView() {}

}


