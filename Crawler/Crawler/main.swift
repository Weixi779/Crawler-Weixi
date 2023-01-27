//
//  main.swift
//  Crawler
//
//  Created by 孙世伟 on 2023/1/25.
//

import Foundation

let URLString = "https://www.baidu.com/"
let data = NetworkManager.shared.URLReuqest(URLString)
let result = NetworkManager.shared.UTF8DataEncoding(data)
print(result)

