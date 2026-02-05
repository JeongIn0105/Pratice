//
//  FirstTableViewCell.swift
//  TableViewPratice
//
//  Created by 이정인 on 2/2/26.
//

/*
 FirstTableViewCell
 
   <프로퍼티>
   menuLabel (UILabel)
   menuImageView (UIImageView)
 
   <제약 조건>
   이미지뷰는 셀의 상하좌로 8간격(top, bottom, leading)
   레이블은 이미지뷰 오른쪽으로 8 간격(menuImageView.snp.trailing) / 셀의 y축 가운데 위치(centerY)
   
   <메서드>
   이름은 configure, 파라미터로 data라는 이름의 String 타입을 받고 -> func configure(data: String) { menuLabel.text = data.name
   Menu 값을 받아서 imageView에 image, label의 text에 name 설정

 코드베이스, SnapKit 사용
 */

import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    let menuLabel = UILabel()
    let menuImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [menuLabel, menuImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        menuImageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(8)
        }
        
        menuLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(menuImageView.snp.trailing).offset(8)
        }
    }
    
    func configure(data: Menu) {
        menuLabel.text = data.name
        menuImageView.image = data.image
    }
}
