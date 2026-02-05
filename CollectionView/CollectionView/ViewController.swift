//
//  ViewController.swift
//  CollectionView
//
//  Created by 이정인 on 2/5/26.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        return .init { section, _ in
            
            switch section {
            case 0:
                return .
            default:
                
            }
        }
    }
    
    func bannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(<#T##fractionalWidth: CGFloat##CGFloat#>), heightDimension: <#T##NSCollectionLayoutDimension#>)
        let item = NSCollectionLayoutItem(layoutSize: <#T##NSCollectionLayoutSize#>)
        let group = NSCollectionLayoutGroup(layoutSize: <#T##NSCollectionLayoutSize#>)
        return .init(group: <#T##NSCollectionLayoutGroup#>)
    }
}

