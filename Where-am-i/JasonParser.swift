//
//  JasonParser.swift
//  Where-am-i
//
//  Created by 임성훈 on 2016. 10. 5..
//  Copyright © 2016년 임성훈. All rights reserved.
//

import Foundation

class JasonParser {
    struct key{ // 키 값 정리
        static let formatted_address = "formatted_address"
        static let results = "results"
    }
    private var formattedAddress: [String] = [] // 주소 배열
    
    func jasonParsing(data: Data){
        do{
            let obj = try JSONSerialization.jsonObject(with: data, options: [])
            guard let dict = obj as? [String: Any] else { // JSON 형식인지 확인
                print("JSON root is not a dictionary")
                return
            }
            guard let array = dict[key.results] as? [[String:Any]] else { // Result가 딕셔너리 배열인지 확인
                print("JSON is not a [[String:Any]]")
                return
            }
            for index in 0..<array.count { // formattedAddress 검색
                formattedAddress.append(array[index][key.formatted_address] as! String) // formattedAddress 배열에 추가
                print(formattedAddress[index])
            }
        } catch {
            print("Data Parsing error")
            return
        }
    }
    
    func getParsingResult() -> [String] { // 파싱한거 리턴
        return formattedAddress
    }
}
