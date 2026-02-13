//
//  ViewController.swift
//  CollectionView
//
//  Created by 이정인 on 2/5/26.
//


import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    private var bannerDatas: [Banner] = [
        .init(title: "새해 이벤트", imageName: "sparkles"),
        .init(title: "배너 1", imageName: "sparkles"),
        .init(title: "배너 2", imageName: "sparkles")
    ]
    
    private var menuDatas: [Menu] = [
        .init(name: "커피", price: 4500, imageName: "cup.and.saucer.fill"),
        .init(name: "케이크", price: 6000, imageName: "birthday.cake.fill"),
        .init(name: "티", price: 5000, imageName: "leaf.fill"),
        .init(name: "빵", price: 3500, imageName: "bag.fill")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        setConstraints()
    }
    
    private func configureUI() {
        view.addSubview(mainCollectionView)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        mainCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: String(describing: BannerCell.self))
        
        mainCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: String(describing: MenuCell.self))
    }
    
    private func setConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    /*
     컬렉션뷰 레이아웃 구현 사항
     
     광고 배너 섹션
     아이템: 그룹 너비와 높이의 100%를 차지.
     그룹: 화면 너비의 90% 차지, 높이는 150pt 고정. (좌우 여백을 주어 다음 카드가 살짝 보이게 설정)
     섹션: 가로 페이징 스크롤 적용
     */
     
    
    private func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        return .init { section, _ in
            
            if section == 0 {
                return self.bannerSection()
            } else {
                return self.menuSection()
            }
        }
    }
    
    private func bannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .absolute(150)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    /*
    메뉴 목록 섹션
    아이템: 그룹 너비의 50% (2열 그리드) 차지. 아이템 간 간격(contentInsets) 8pt 적용.
    그룹: 화면 전체 너비 사용, 높이는 180pt 고정.
    섹션: 일반적인 세로 스크롤 방식.
    */
    
    private func menuSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(180)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 0: banner section, 1: menu grid section
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return bannerDatas.count
        } else {
            return menuDatas.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        
        if section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BannerCell.self), for: indexPath) as? BannerCell else {
                return .init()
            }
            
            guard indexPath.item < bannerDatas.count else { return UICollectionViewCell() }
            let data = bannerDatas[indexPath.item]
            cell.configure(data: data)
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuCell.self), for: indexPath) as? MenuCell else {
                return .init()
            }
            
            guard indexPath.item < menuDatas.count else { return UICollectionViewCell() }
            let data = menuDatas[indexPath.item]
            cell.configure(data: data)
            return cell
        }
    }
}

