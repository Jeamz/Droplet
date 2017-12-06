//
//  GenResponse.swift
//  Novo
//
//  Created by James Avery on 8/12/17.
//  
//

import Foundation

struct GetImagesResponse {
    
    var images: [Image]
    
    init(json: JSON) throws { 
        guard let data = json["data"] as? [JSON] else { throw Errors.someError }
        let images = data.map{ Image(json: $0) }.flatMap{ $0 }
        self.images = images
    }
}
