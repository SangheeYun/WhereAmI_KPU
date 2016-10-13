//
//  WebAccess.swift
//  Where-am-i
//
//  Created by 임성훈 on 2016. 10. 5..
//  Copyright © 2016년 임성훈. All rights reserved.
//

import Foundation

class WebAccess {
    
    private var url: String
    private var data = Data()
    
    init(latitude: String, longitude: String) {
        // url 생성
        self.url = "https://maps.googleapis.com/maps/api/geocode/json?language=ko&latlng="+latitude+","+longitude+"&language=ko&location_type=ROOFTOP&key=AIzaSyCywfNbcozG_Tg5M565_Noyb1ELl_ZV-gk"
    }
    
    func getJasonDataFromURL() { // 웹에서 jason 받아옴
        guard let url = URL(string: self.url) else {
            print("Invalid URL String")
            return
        }
        do {
            data = try Data(contentsOf: url)
        } catch {
            print("Data loading error")
            return
        }
    }
    
    func getData() -> Data { // 받아온거 리턴
        return self.data
    }
}
