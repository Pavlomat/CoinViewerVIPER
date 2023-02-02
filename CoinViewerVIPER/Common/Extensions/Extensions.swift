//
//  Extensions.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

extension UILabel {
    static func createLabel(font: UIFont.TextStyle) -> UILabel {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: font)
            label.adjustsFontForContentSizeCategory = true
            label.numberOfLines = 0
            label.textColor = .black
            label.textAlignment = .center
            return label
    }
}

extension CoinData {
    func checkData(from data: Double?) -> String {
        if let checkedData = data {
            return String(format: "%.3f", checkedData)
        } else {
            return "No data"
        }
    }
}


