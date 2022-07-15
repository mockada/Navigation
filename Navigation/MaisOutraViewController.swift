//
//  MaisOutraViewController.swift
//  Navigation
//
//  Created by Jade on 15/07/22.
//

import Foundation
import UIKit

class MaisOutraViewController: UIViewController {
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("BOTAAAAAO", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    func didTapButton() {
        navigationController?.dismiss(animated: true)
        dismiss(animated: true)
    }
}
