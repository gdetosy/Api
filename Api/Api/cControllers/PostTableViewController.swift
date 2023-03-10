//
//  PostTableViewController.swift
//  Api
//
//  Created by tosy on 25.12.22.
//

import UIKit

class PostTableViewController: UITableViewController {

   
    var user: User?
    var posts: [Post] = []
    
    // тут лучше использовать Delagates либо Clousers
    // плохое решение
    override func viewWillAppear(_ animated: Bool) {
        fetchPosts()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }

    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }

    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete, let id = posts[indexPath.row].id {
//            NetworkService.deletePost(postID: id) { [weak self] json, error in
//                if json != nil {
//                    self?.posts.remove(at: indexPath.row)
//                    tableView.deleteRows(at: [indexPath], with: .automatic)
//                } else if let error = error {
//                    print(error)
//                }
//            }
//        }
//    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "commentsSegue", sender: indexPath)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? CommentsTVC,
//           let indexPath = sender as? IndexPath {
//            let post = posts[indexPath.row]
//            vc.postId = post.id
//        } else if let vc = segue.destination as? NewPostVC {
//            vc.user = user
//        }
    }
    
    func fetchPosts() {
        
        guard let userId = user?.id else { return }
        let pathUrl = "\(ApiConstants.postsPath)?userId=\(userId)"
print(pathUrl)
        guard let url = URL(string: pathUrl) else { return }
print(url)
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.posts = try JSONDecoder().decode([Post].self, from: data)
                print(self.posts)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

}
