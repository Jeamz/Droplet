//
//  MainAPI.swift
//  Novo
//
//  Created by James Avery on 8/12/17.
//  
//

import Foundation

typealias JSON = [String: Any]

class MainAPI {
    
    static let shared = MainAPI()
    private init() {}
    
    let session = URLSession.shared
    
    func getImages(success successBlock: @escaping (GetImagesResponse) -> Void){
        let myUrl = URL(string: "<URL>");
        
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "POST"
        let payload = "post_id=1&email=jamesavery400@gmail.com&password=mypass123" //testing payload
        
        request.httpBody = payload.data(using: .utf8)
        
        session.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else { return }
                let getImagesResponse = try GetImagesResponse(json: json)
                successBlock(getImagesResponse)
            } catch {}
        }.resume()
    }
    
}

