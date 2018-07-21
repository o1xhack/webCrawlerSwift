//
//  Page.swift
//  webCrawlerCode
//
//  Created by wyx on 2018/7/21.
//  Copyright © 2018 LifeAnalysis Lab. All rights reserved.
//

import Foundation

// Model to handle the parsing of JSON
class Page : NSObject {
    
    var address: String
    var links: [String]
    
    
    init? (address: String, links: [String]) {
        self.address = address;
        self.links = links
        super.init()
    }
    
}
