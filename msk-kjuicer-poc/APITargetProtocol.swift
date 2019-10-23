//
//  APITargetProtocol.swift
//  msk-kjuicer-poc
//
//  Created by Gabriel Walsh on 10/23/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import Foundation
import Moya

protocol APITargetable {
    var provider: MoyaProvider<KJuicerAPITargets> { get }
    func handleIncomingText(key: String, title: String, content: String, completion: @escaping (String, Error)-> ())
}

