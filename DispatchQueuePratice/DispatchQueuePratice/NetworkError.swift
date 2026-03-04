//
//  NetworkError.swift
//  DispatchQueuePratice
//
//  Created by 이정인 on 2/27/26.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case sessionError
    case responseError
    case notFoundError
    case dataError
    case decodingError
}
