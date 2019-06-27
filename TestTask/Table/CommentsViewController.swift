//
//  CommentsViewController.swift
//  TestTask
//
//  Created by Артем Шпилька on 27.06.19.
//  Copyright © 2019 Артем Шпилька. All rights reserved.
//

import UIKit

class CommentsViewController: UITableViewController {

    var lowerBound: Int = 0
    var upperBound: Int = 0
    var page: Int = 1
    var limit: Int = 10
    
    var comments = [Comment]()
    
    var fetchingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")

        Comment.getComments(id_gte: lowerBound, id_lte: upperBound, page: page, limit: limit) { (comments) in
            self.comments = comments
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        
        let item = comments[indexPath.row]
        
        cell.id.text = "\(item.id)"
        cell.postId.text = "\(item.postId)"
        cell.name.text = item.name
        cell.email.text = item.email
        cell.body.text = item.body

        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height{
            if !fetchingMore{
                beginBatchFetch()
            }
        }
    }
 
    func beginBatchFetch(){
        fetchingMore = true
  
        if comments.contains(where: { $0.id == upperBound }){
        
        }else{
            page += 1
            
            Comment.getComments(id_gte: lowerBound, id_lte: upperBound, page: page, limit: limit) { (comments) in
                DispatchQueue.main.async {
                    self.comments.append(contentsOf: comments)
                    self.fetchingMore = false
                    self.tableView.reloadData()
                }
                
            }
        }
    }

}
