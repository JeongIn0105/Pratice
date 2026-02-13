//
//  MenuCell.swift
//  CollectionView
//
//  Created by 이정인 on 2/10/26.
//

/*
 MenuCell
 전체 배경: backgroundColor = .systemGray6, cornerRadius = 12
 
 menuImageView
 width = 50pt, height = 50pt
 nameLabel
 font = .systemFont(ofSize: 16, weight: .semibold)
 priceLabel
 font = .systemFont(ofSize: 14, weight: .regular)
 textColor = .systemGray
 
 UIStackView (Vertical):
 spacing = 6
 alignment = .center
 distribution = .fill
 Constraints: 셀의 centerX, centerY에 고정.
 */

import UIKit
import SnapKit

class MenuCell: UICollectionViewCell {
    
    private let menuImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [menuImageView, nameLabel, priceLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .fill
        
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
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 12
    }
    
    func setConstraints() {
        menuImageView.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configure(data: Menu) {
        menuImageView.image = UIImage(systemName: data.imageName)
        nameLabel.text = "\(data.name)"
        priceLabel.text = "\(data.price)원"
    }
}

