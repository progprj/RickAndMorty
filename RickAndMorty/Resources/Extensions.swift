//
//  Extensions.swift
//  RickAndMorty
//
//  Created by 한민규 on 2023/09/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
