//
//  BannerCell.swift
//  CollectionView
//
//  Created by 이정인 on 2/10/26.
//

/*
 BannerCell
 전체 배경: backgroundColor = .systemYellow, alpha = 0.2, cornerRadius = 15
 
 bannerImageView
 width = 60pt, height = 60pt
 contentMode = .scaleAspectFit
 
 titleLabel
 font = .systemFont(ofSize: 20, weight: .bold)
 
 UIStackView (Horizontal):
 spacing = 15
 alignment = .center
 Constraints: 셀의 top, leading, trailing, bottom으로부터 각각 20pt 여백.
 */

import UIKit
import SnapKit

class BannerCell: UICollectionViewCell {
    
    private let bannerImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [bannerImageView, titleLabel])
        stackView.spacing = 15
        stackView.alignment = .center
        
        return stackView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(stackView)
        
        contentView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.2)
        contentView.layer.cornerRadius = 15
    }
    
    func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        bannerImageView.snp.makeConstraints { make in
            make.size.equalTo(60)
        }
    }
    
    func configure(data: Banner) {
        titleLabel.text = data.title
        bannerImageView.image = UIImage(systemName: data.imageName)
    }
}

