//
//  NetworkManager.swift
//  Crawler
//
//  Created by 孙世伟 on 2023/1/25.
//

import Foundation

enum HTMLEncode {
    case UFT8, GB2312
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - 基础部分
    public func URLReuqest(_ targetURL: String) -> Data? {
        var result: Data? = nil
        let reuqestURL = URL(string: targetURL)!
        let task = URLSession.shared.dataTask(with: reuqestURL) { data, response, error in
            // 错误处理
            if error != nil {
                self.log("NetworkReuqest is Error")
                return
            }
            // 状态码处理
            if let response = response as? HTTPURLResponse {
                let code = response.statusCode
                // 成功处理
                if code >= 200 && code < 300 {
                    result = data
                }
                self.log("Request StatusCode is \(code)")
            }
            
        }
        task.resume()
        
        return result
    }
    
    private func log(_ arguments: String) {
        print("---- NetworkManager: \(arguments) ----")
    }
    
    public func UTF8DataEncoding(_ input: Data?) -> String {
        guard let input = input else {
            self.log("UTF8DataEncoding input data is nil!")
            return ""
        }
        
        if let result = String(data: input, encoding: .utf8) {
            return result
        }
        
        self.log("UTF8DataEncoding Convert Error")
        
        return ""
    }
}

