//
//  ViewController.swift
//  Class
//
//  Created by 이정인 on 1/23/26.
//

import UIKit
import SnapKit

class MainViewController: UIViewController { // 뷰 컨트롤러 이름 : MainViewController
    
    let printer = Printer() // 프로퍼티명 printer, Printer 인스턴스

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white

        printer.printName() // viewDidLoad에서 printer의 printName() 함수 실행
    }
}


