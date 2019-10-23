//
//  NetworkManager.swift
//  msk-kjuicer-poc
//
//  Created by Gabriel Walsh on 10/23/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import Foundation
import Moya

enum APIEnvironment {
    case local
    case development
    case qa
    case production
}

struct NetworkManager{
    static let provider = MoyaProvider<KJuicerAPITargets>(plugins: [ NetworkLoggerPlugin(verbose: true)])
    static let environment: APIEnvironment = .production
}
