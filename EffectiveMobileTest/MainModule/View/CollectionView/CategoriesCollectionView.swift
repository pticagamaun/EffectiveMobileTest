//
//  CategoriesCollectionView.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 19.09.2023.
//

import UIKit

final class CategoriesCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionFlowLayout)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let collectionFlowLayout = UICollectionViewFlowLayout()
    
    private func setupCollectionView() {
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIndentifier")
        delegate()
        backgroundColor = .white
        collectionFlowLayout.scrollDirection = .vertical
    }
    
    private func delegate() {
        delegate = self
        dataSource = self
    }
}

extension CategoriesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIndentifier", for: indexPath)
        cell.backgroundColor = .blue
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension CategoriesCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension CategoriesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let desiredWidth = collectionView.frame.width - 20
        let desiredHeight: CGFloat = 155
        return CGSize(width: desiredWidth, height: desiredHeight)
    }
}
