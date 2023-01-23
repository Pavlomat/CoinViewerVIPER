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
            label.textColor = .white
            label.textAlignment = .center
            return label
    }
}
