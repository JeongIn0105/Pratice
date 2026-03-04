//
//  CharacterModel.swift
//  DispatchQueuePratice
//
//  Created by 이정인 on 3/3/26.
//

import Foundation

// API 전체 응답 구조
struct CharacterResponse: Decodable {
    let results: [CharacterResult]
}

// results 안에 들어있는 각각의 캐릭터 데이터
struct CharacterResult: Decodable {
    let id: Int
    let name: String
    let image: String
}
