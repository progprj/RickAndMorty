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
        
        let req = RMRequest(endpoint: .character, queryParams: [
            URLQueryItem(name: "name", value: "rick"),
            URLQueryItem(name: "status", value: "alive")
        ]
    )
        print(req.url)
        
//        RMService.shared.execute(req, expecting: String.self) { result in
//            switch result {
//                
//            }
//        }
}
    

 

}
