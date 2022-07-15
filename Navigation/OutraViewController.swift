//
//  OutraViewController.swift
//  Navigation
//
//  Created by Jade on 15/07/22.
//
import UIKit
import Foundation

final class OutraViewController: UIViewController {
    private lazy var popButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("POP", for: .normal)
        button.addTarget(self, action: #selector(didTapPopButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var popToViewControllerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("POP TO VIEW CONTROLLER", for: .normal)
        button.addTarget(self, action: #selector(popToViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PRESENT", for: .normal)
        button.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(popButton)
        view.addSubview(popToViewControllerButton)
        view.addSubview(presentButton)
        NSLayoutConstraint.activate([
            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            popToViewControllerButton.topAnchor.constraint(equalTo: popButton.bottomAnchor, constant: 16),
            popToViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            presentButton.topAnchor.constraint(equalTo: popToViewControllerButton.bottomAnchor, constant: 16),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

@objc
private extension OutraViewController {
    func didTapPopButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didTapPresentButton() {
        let viewController = MaisOutraViewController()
        viewController.navigationDelegate = self
        navigationController?.present(viewController, animated: true)
    }
    
    func popToViewController() {
        guard let viewController = navigationController?.viewControllers.first(where: { viewController in
            viewController.isKind(of: ViewController.self)
        }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
}

extension OutraViewController: NavigationDelegate {
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}
