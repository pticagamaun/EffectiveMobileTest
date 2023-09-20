//
//  ViewController.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import UIKit
import SnapKit

protocol CategoriesViewProtocol: AnyObject {
    var didSendEventClosure: ((CategoriesViewController.Event) -> Void)? {get set}
}

final class CategoriesViewController: UIViewController {
    
    internal var didSendEventClosure: ((CategoriesViewController.Event) -> Void)?
    private let locationManagerHandler = LocationManagerHandler()
    private let collectionView = CategoriesCollectionView()
    private let dateLocationView = NavigationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
        setupLocationHandler()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        view.addSubviews(dateLocationView, collectionView)
    }
    
    private func setupLocationHandler() {
        locationManagerHandler.delegate = self
    }
    
    @objc private func buttonPressed() {
        didSendEventClosure?(.categories)
    }
}

extension CategoriesViewController {
    private func setConstraints() {
        dateLocationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(60)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(dateLocationView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension CategoriesViewController {
    enum Event {
        case categories
    }
}

extension CategoriesViewController: NavigationViewDelegate {
    func didUpdateLocation(city: String) {
        dateLocationView.locationLabel.text = city
    }

    func didFailToUpdateLocation(error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
}
