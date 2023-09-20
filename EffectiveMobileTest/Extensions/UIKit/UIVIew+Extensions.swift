//
//  UIVIew+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 20.09.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
