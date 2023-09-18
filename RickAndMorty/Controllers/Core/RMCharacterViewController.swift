//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/12.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        
        
        RMService.shared.execute(.listingCharacterRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total : " + String(model.info.pages))
                print("Page Result count : " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
