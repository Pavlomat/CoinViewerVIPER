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

extension UIWindow {
    
    func switchRootViewController(_ viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.5,
                                  options: AnimationOptions = .transitionFlipFromRight,
                                  completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
    
}
