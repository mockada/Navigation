//
//  ViewController.swift
//  Navigation
//
//  Created by Jade on 15/07/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var pushButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PUSH", for: .normal)
        button.addTarget(self, action: #selector(didTapPushButton), for: .touchUpInside)
        return button
    }()
    
    lazy var presentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PRESENT", for: .normal)
        button.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(pushButton)
        view.addSubview(presentButton)
        
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 16),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        let navigationControllerSubFlow = UINavigationController(rootViewController: MaisOutraViewController())
////        navigationController?.present(navigationControllerSubFlow, animated: true)
//
//        /*
//         - ViewController -> MaisOutraViewController
//         - OutraViewController
//         */
//
//
//    }
}

@objc
extension ViewController {
    func didTapPushButton() {
        navigationController?.pushViewController(OutraViewController(), animated: true)
    }
    
    func didTapPresentButton() {
        navigationController?.present(MaisOutraViewController(), animated: true)
    }
}
