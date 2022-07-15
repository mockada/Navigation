//
//  ViewController.swift
//  Navigation
//
//  Created by Jade on 15/07/22.
//

import UIKit

protocol NavigationDelegate: AnyObject {
    func popToRoot()
}

final class ViewController: UIViewController {
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PUSH", for: .normal)
        button.addTarget(self, action: #selector(didTapPushButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PRESENT", for: .normal)
        button.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var presentNavigationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PRESENT NAVIGATION", for: .normal)
        button.addTarget(self, action: #selector(didTapPresentNavigationButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(pushButton)
        view.addSubview(presentButton)
        view.addSubview(presentNavigationButton)
        
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 16),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            presentNavigationButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 16),
            presentNavigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

@objc
private extension ViewController {
    func didTapPushButton() {
        navigationController?.pushViewController(OutraViewController(), animated: true)
    }
    
    func didTapPresentButton() {
        let viewController = MaisOutraViewController()
        viewController.navigationDelegate = self
        navigationController?.present(viewController, animated: true)
//        present(MaisOutraViewController(), animated: true)
    }
    
    func didTapPresentNavigationButton() {
        let navigationControllerSubFlow = UINavigationController(rootViewController: MaisOutraViewController())
        navigationController?.present(navigationControllerSubFlow, animated: true)
    }
}

extension ViewController: NavigationDelegate {
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}
