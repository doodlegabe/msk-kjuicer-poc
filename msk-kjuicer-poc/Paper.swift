//
//  Paper.swift
//  msk-kjuicer-poc
//
//  Created by Gabriel Walsh on 10/23/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import Foundation

struct Paper{
    var id: String
    var url: String
}

extension Paper: Decodable{
    
    enum PaperCodingKeys: String, CodingKey{
        case id
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PaperCodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        url = try container.decode(String.self, forKey: .url)
    }
    
}
