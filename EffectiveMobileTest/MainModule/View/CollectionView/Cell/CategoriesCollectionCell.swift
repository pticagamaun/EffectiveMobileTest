//
//  CategoriesCollectionCell.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 20.09.2023.
//

import UIKit
import SnapKit

final class CategoriesCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let identifier = "CategoriesCollectionCell"
}

extension CategoriesCollectionCell {
    private func setConstraints() {
        
    }
}
