//
//  ViewController.swift
//  URLSessionExam
//
//  Created by 이정인 on 2/19/26.
//


 
/*
 NetworkService 이름의 네트워크 담당 클래스를 만들고 뷰 컨트롤러에서 사용하는 구조
 
 호출 후 Decoding까지 완료 후 completion을 통한 print

 URLSession 이용해 iOS 앱에서 실습 진행
 */

import UIKit

class ViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try networkService.getCharacter(name: "rick") { result in
                switch result {
                case .success(let character):
                    print(character.results.first?.name ?? "No name") // Decoding까지 완료 후 completion을 통한 print.
                    print(character.results.count)
                case .failure(let error):
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
}

