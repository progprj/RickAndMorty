//
//  VMCharacterListView.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/20.
//

import UIKit

protocol VMCharacterListViewDelegate: AnyObject {
    func didLoadInitialCharacters()
}

final class VMCharacterListView: NSObject {
    
    public weak var delegate: VMCharacterListViewDelegate?
    
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellVM(characterName: character.name,
                                                                characterStatus: character.status,
                                                                characterImageUrl: URL(string: character.image))
                
                cellViewModels.append(viewModel)
                
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellVM] = []
    
    
    func fetchCharacters() {
        RMService.shared.execute(.listingCharacterRequest, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters = results
                
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension VMCharacterListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("cell error")
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    
    
}
