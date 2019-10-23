//
//  KJuicerAPIMocks.swift
//  msk-kjuicer-poc
//
//  Created by Gabriel Walsh on 10/23/19.
//  Copyright © 2019 Gabriel Walsh. All rights reserved.
//

import Foundation
import Moya

func stubbedResponse(_ fileName: String) -> Data{
    @objc class Spec: NSObject {}
    let factory = Bundle(for: Spec.self)
    let path = factory.path(forResource: fileName, ofType: "json")
    return (try! Data.init(contentsOf: URL(fileURLWithPath: path!)))
}

extension KJuicerAPITargets{
    var sampleData: Data{
        switch self{
            case .postTextToEditor : return stubbedResponse("Paper")
        }
    }
}
