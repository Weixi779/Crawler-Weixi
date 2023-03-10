//
//  Jable.swift
//  Crawler
//
//  Created by 孙世伟 on 2023/2/3.
//

import Foundation

class Jable {
    var baseComponent: URLComponents
    
    init() {
        self.baseComponent = URLComponents()
        self.baseComponent.scheme = "https"
        self.baseComponent.host = "jable.tv"
    }
}
