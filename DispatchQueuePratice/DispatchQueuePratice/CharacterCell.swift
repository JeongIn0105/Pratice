//
//  CharacterCell.swift
//  DispatchQueuePratice
//
//  Created by 이정인 on 2/27/26.
//

/*
 CharacterCell
 
 characterImageView
 size : 50
 top, leading, bottom / inset 8 / priority: low
 Kingfisher 사용해서 이미지 로딩하기 (중요)

 nameLabel
 cell의 centerY
 trailing / inset 8
 Character의 Result 값의 id, name, image 사용, 뷰 설정 메서드 만들기
 */

import UIKit
import SnapKit
import Kingfisher
import Then

final class CharacterCell: UITableViewCell {
    
    static let identifier = "CharacterCell"
    
    private let characterImageView = UIImageView().then {
        
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        
    }
    
    private let nameLabel = UILabel().then {
        
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.textColor = .black
        $0.textAlignment = .right
        $0.numberOfLines = 1
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        characterImageView.kf.cancelDownloadTask()
        characterImageView.image = nil
        nameLabel.text = nil
    }

    private func configureUI() {
        
        contentView.backgroundColor = .white
        
        [characterImageView, nameLabel].forEach { contentView.addSubview($0) }
        
        characterImageView.snp.makeConstraints {
            $0.size.equalTo(50)
            
            // top, leading, bottom / inset 8 / priority: low
            $0.top.equalToSuperview().inset(8).priority(.low)
            $0.leading.equalToSuperview().inset(8).priority(.low)
            $0.bottom.equalToSuperview().inset(8).priority(.low)
            
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
        }
        
    }
    
    func configure(with result: CharacterResult) {
        nameLabel.text = "\(result.id): \(result.name)"
        
        guard let url = URL(string: result.image) else {
            characterImageView.image = UIImage(systemName: "person.crop.square")
            return
        }
        
        // Kingfisher 사용해서 이미지 로딩하기 (중요)
        characterImageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "person.crop.square"),
            options: [
                .cacheOriginalImage,
                .transition(.fade(0.2))
            ]
        )
    }
    
}
