//
//  KJuicerAPITargets.swift
//  msk-kjuicer-poc
//
//  Created by Gabriel Walsh on 10/23/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import Foundation
import Moya


enum KJuicerAPITargets {
    case postTextToEditor(key: String, title: String, content: String)
}

extension KJuicerAPITargets: TargetType {
    var baseURL: URL {
        return URL(string: "\(APIKeys.baseurl.rawValue)")!
    }
    
    var path: String {
        switch self {
        case .postTextToEditor:
            return "papers/i/\(APIKeys.APIId.rawValue)/"
        }
    }
    
    var method: Moya.Method  {
        switch self {
        case .postTextToEditor:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postTextToEditor(let key, let title, let content):
            return .requestParameters(parameters: ["key": key, "title": title, "content": content], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .postTextToEditor:
            return ["Content-type": "application/json"]
        }
    }
}
