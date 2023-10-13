//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/12.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    
    private let characterListView = RMCharacterListView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(characterListView)
        
        NSLayoutConstraint.activate([
        
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }
    
}
