//
//  ViewController.swift
//  DispatchQueuePratice
//
//  Created by 이정인 on 2/27/26.
//

/*
 지난 실습 프로젝트를 더 개발
 새로운 코드베이스 MainViewController를 만들어서 작업
 아래의 셀을 사용하는 테이블뷰를 사용
 */

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    // 테이블 뷰 데이터
    private var characters: [CharacterResult] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.characterTableView.reloadData()
            }
        }
    }
    
    private let characterTableView = UITableView().then {
        
        $0.backgroundColor = .white
        $0.separatorInset = .zero
        
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchCharacters()
    }
    
    private func configureUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(characterTableView)
        
        characterTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        characterTableView.dataSource = self
        characterTableView.delegate = self
        
        characterTableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
    }
    
    private func fetchCharacters() {
        
        do {
            try networkService.getCharacter(name: "rick") { [weak self] result in
                switch result {
                case .success(let response):
                    self?.characters = response.results
                    
                    // 디버그
                    print(response.results.first?.name ?? "No name") // Decoding까지 완료 후 completion을 통한 print.
                    print(response.results.count)
                    
                case .failure(let error):
                    print(error)
                }
            }
        } catch {
            print(error)
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterCell.identifier,
            for: indexPath
        ) as? CharacterCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: characters[indexPath.row])
        return cell
    }
}

