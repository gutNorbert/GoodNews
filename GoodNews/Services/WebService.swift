//
//  WebService.swift
//  GoodNews
//
//  Created by Lightport Developer on 2020. 04. 14..
//  Copyright © 2020. Lightport Developer. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class WebService {
    func load <T>(_ resource: Resource<T>,completion: @escaping (T?) -> ()){
        URLSession.shared.dataTask(with: resource.url){ data,response,error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
