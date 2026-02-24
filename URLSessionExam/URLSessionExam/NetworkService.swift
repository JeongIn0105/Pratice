//
//  NetworkService.swift
//  URLSessionExam
//
//  Created by 이정인 on 2/19/26.
//

import Foundation

/*
어떤 에러 및 예외가 있을지 생각해서 에러 정의해보기
상태 코드 처리는 404만 처리해보기
에러 처리는 throws, Result 둘다 사용
*/

class NetworkService {
    
    func getCharacter(name: String, completion: @escaping (Result<Character, NetworkError>) -> Void) throws {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/character/"
        urlComponents.queryItems = [
            .init(name: "name", value: name)
        ]
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
           
            if error != nil {
                completion(.failure(.sessionError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.responseError))
                return
            }
            
            // 상태 코드 처리는 404만 처리해보기.
            if response.statusCode == 404 {
                completion(.failure(.notFoundError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let character = try JSONDecoder().decode(Character.self, from: data)
                completion(.success(character))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
}

