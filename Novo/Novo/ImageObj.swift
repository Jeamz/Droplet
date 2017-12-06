//
//  ImageObj.swift
//  Novo
//
//  Created by James Avery on 8/12/17.
//  
//

import Foundation

struct Image {
    private let file: String
    
    init?(json: JSON) {
        guard let file = json["file"] as? String else { return nil }
        self.file = file
    }
}
