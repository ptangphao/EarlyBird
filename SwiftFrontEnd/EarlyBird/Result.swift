//
//  Result.swift
//  EarlyBird
//
//  Created by Max Peiros on 6/12/17.
//  Copyright © 2017 Max Peiros. All rights reserved.
//

import UIKit

class Result: NSObject {
    
    fileprivate var _resultName: String!
    fileprivate var _resultUrl: String!
    
    var resultName: String {
        return _resultName
    }
    
    var resultUrl: String {
        if _resultUrl.contains("?") {
            return _resultUrl.substring(to: _resultUrl.characters.index(of: "?")!)
        } else {
            return _resultUrl
        }
    }
    
    init(name: String, url: String) {
        self._resultName = name
        self._resultUrl = url
    }
}
