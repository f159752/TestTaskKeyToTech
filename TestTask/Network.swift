//
//  Network.swift
//  TestTask
//
//  Created by Артем Шпилька on 27.06.19.
//  Copyright © 2019 Артем Шпилька. All rights reserved.
//

import Foundation

let API_URL : String = "http://jsonplaceholder.typicode.com/comments"


func GET_REQUEST_LIST(url: URL, completion:@escaping (_ : [[String: Any]]) -> ()){
    let session = URLSession.shared
    var json : [[String: Any]] = [[:]]
    session.dataTask(with: url) { (data, response, error) in
        //        if let response = response{
        //            print(response)
        //        }
        
        guard let data = data else {return}
        //        print(data)
        
        do{
            json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
            //            print(json)
        }catch{
            print(error)
        }
        completion(json)
        }.resume()
}
