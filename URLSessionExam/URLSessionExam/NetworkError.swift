//
//  NetworkError.swift
//  URLSessionExam
//
//  Created by 이정인 on 2/19/26.
//

import Foundation

// 어떤 에러 및 예외가 있을지 생각해서 에러 정의해보기.
enum NetworkError: Error {
    case invalidURL
    case sessionError
    case responseError
    case notFoundError
    case dataError
    case decodingError
}
