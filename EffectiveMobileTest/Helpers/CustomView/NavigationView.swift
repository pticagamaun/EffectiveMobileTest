//
//  DateLocationView.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 19.09.2023.
//

import UIKit
import SnapKit

protocol NavigationViewDelegate: AnyObject {
    func didUpdateLocation(city: String)
    func didFailToUpdateLocation(error: Error)
}

final class NavigationView: UIView {
    
    weak var delegate: NavigationViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    private let geoPinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pin")
        return imageView
    }()
    private let currentDateLabel: UILabel = {
        let label = UILabel()
        label.text = Date().formattedDate
        return label
    }()
    
    private func setupView() {
        addSubviews(locationLabel, geoPinImage, currentDateLabel)
    }
}

extension NavigationView {
    private func setConstraints() {
        geoPinImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(8)
            make.height.equalTo(27)
            make.width.equalTo(26)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(geoPinImage.snp.top)
            make.left.equalTo(geoPinImage.snp.right).offset(2)
        }
        
        currentDateLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(3)
            make.left.equalTo(geoPinImage.snp.right).offset(2)
        }
    }
}
