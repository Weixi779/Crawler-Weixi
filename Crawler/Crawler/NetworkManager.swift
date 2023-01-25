//
//  NetworkManager.swift
//  Crawler
//
//  Created by 孙世伟 on 2023/1/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func networkReuqest(_ targetURL: String) async -> String {
        var result = ""
        return result
    }
}
