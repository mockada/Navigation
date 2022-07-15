//
//  MaisOutraViewController.swift
//  Navigation
//
//  Created by Jade on 15/07/22.
//

import Foundation
import UIKit

final class MaisOutraViewController: UIViewController {
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PUSH", for: .normal)
        button.addTarget(self, action: #selector(didTapPushButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("DISMISS", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonRoot: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("DISMISS AND POP", for: .normal)
        button.addTarget(self, action: #selector(dismissModalAndPopToRoot), for: .touchUpInside)
        return button
    }()
    
    weak var navigationDelegate: NavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(pushButton)
        view.addSubview(button)
        view.addSubview(buttonRoot)
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonRoot.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            buttonRoot.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

@objc
private extension MaisOutraViewController {
    func didTapPushButton() {
        navigationController?.pushViewController(OutraViewController(), animated: true)
    }
    
    func didTapButton() {
        // Usar navigationController não funciona pois não dei present navigation nessa tela
        dismiss(animated: true)
    }
    
    func dismissModalAndPopToRoot() {
        // Usar navigationController não funciona pois não dei present navigation nessa tela
        dismiss(animated: true, completion: {
            self.navigationDelegate?.popToRoot()
        })
    }
}
