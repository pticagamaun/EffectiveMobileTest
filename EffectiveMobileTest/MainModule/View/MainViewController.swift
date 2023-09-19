//
//  ViewController.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 11.09.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    internal var didSendEventClosure: ((MainViewController.Event) -> Void)?
    private lazy var someButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("Жмяк", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Main"
        view.addSubview(someButton)
        setConstraints()
    }
    
    deinit {
        print("ReadyViewController deinit")
    }
    
    @objc private func buttonPressed() {
        didSendEventClosure?(.main)
    }
}

extension MainViewController {
    private func setConstraints() {
        someButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(100)
            make.center.equalToSuperview()
        }
    }
}

extension MainViewController {
    enum Event {
        case main
    }
}
