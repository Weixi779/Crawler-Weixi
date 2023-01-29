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
    
    // MARK: - URLRequest
    private func createURLRequest(_ targetURL: String) -> URLRequest {
        let url = URL(string: targetURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    private func addRequestHeader(_ request: inout URLRequest, _ header: String, _ value: String) {
        request.addValue(value, forHTTPHeaderField: header)
    }
    
    public func networkRequest(_ targetURL: String) async throws -> Data {
        let request = self.createURLRequest(targetURL)
        let (data, response) = try await URLSession.shared.data(for: request)

        if let response = response as? HTTPURLResponse {
            self.log("\(targetURL) Request StatusCode is \(response.statusCode)")
        }
        return data
    }
    
    private func log(_ arguments: String) {
        print("---- NetworkManager: \(arguments) ----")
    }

    // MARK: - String Convert
    public func UTF8DataEncoding(_ input: Data) -> String {        
        if let result = String(data: input, encoding: .utf8) {
            return result
        }
        
        self.log("UTF8DataEncoding Convert Error")
        
        return ""
    }
    
    public func GB2312DataEncoding(_ input: Data) -> String {
        let GB2312RawValue = UInt32(CFStringEncodings.GB_18030_2000.rawValue)
        let StringEncoding = CFStringConvertEncodingToNSStringEncoding(GB2312RawValue)
        let buffer = String.Encoding(rawValue: StringEncoding)
        
        if let result = String(data: input, encoding: buffer) {
            return result
        }
        
        self.log("GB2312DataEncoding Convert Error")
        
        return ""
    }
}

