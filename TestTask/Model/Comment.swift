//
//  Comment.swift
//  TestTask
//
//  Created by Артем Шпилька on 27.06.19.
//  Copyright © 2019 Артем Шпилька. All rights reserved.
//

import Foundation

class Comment{
    var id: Int
    var postId: Int
    var name: String
    var email: String
    var body: String
    
    init(id: Int, postId: Int, name: String, email: String, body: String) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }
    
    static func getComments(id_gte: Int, id_lte: Int, page: Int, limit: Int, completion: @escaping ([Comment])->()){
        GET_REQUEST_LIST(url: URL(string: "\(API_URL)?id_gte=\(id_gte)&id_lte=\(id_lte)&_page=\(page)&_limit=\(limit)")!) { (JSON) in
            var comments = [Comment]()
            
//            print(JSON)
            for item in JSON{
                let newComment = Comment(id: item["id"] as! Int,
                                         postId: item["postId"] as! Int,
                                         name: item["name"] as! String,
                                         email: item["email"] as! String,
                                         body: item["body"] as! String)
                
                comments.append(newComment)
            }
            completion(comments)
        }
        
        
        
        
//        return comments
    }
}
