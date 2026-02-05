//
//  ViewController.swift
//  TableViewPratice
//
//  Created by 이정인 on 2/2/26.
//

/*
 1. 테이블뷰 객체를 만든다
 2. 테이블뷰를 뷰에 추가한다. 레이아웃 설정한다.
 3. 데이터를 만든다.
 4. Delegate, DataSource 설정한다.
 5. Cell을 만들고 register 한다.
 6. cellForRowAt에서 데이터 설정을 한다.
 */



/*
 FirstViewController
 
 프로퍼티
 tableView (UITableView)
 datas ([Menu])
 
 코드베이스, SnapKit 사용
 */

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    let tableView = UITableView()
    
    let datas: [Menu] = [
        .init(image: UIImage(systemName: "pencil"), name: "연필"),
        .init(image: UIImage(systemName: "eraser"), name: "지우개"),
        .init(image: UIImage(systemName: "trash"), name: "쓰레기통"),
        .init(image: UIImage(systemName: "highlighter"), name: "형광펜")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI()
        
        setConstraints()
    }
    
    private func configureUI() {
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            FirstTableViewCell.self,
            forCellReuseIdentifier: String(describing: FirstTableViewCell.self)
            )
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}


extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self), for: indexPath) as? FirstTableViewCell else {
            return .init()
        }
        
        let data = datas[indexPath.row]
        cell.configure(data: data)
        return cell
    }
   
}

