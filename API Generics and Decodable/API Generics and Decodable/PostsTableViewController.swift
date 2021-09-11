

import UIKit
import Alamofire

class PostsTableViewController: UITableViewController {
    
    // https://jsonplaceholder.typicode.com/comments
  var posts = [PostModel]()
var comments  = [CommentModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        PostsApiServices.shared.getData(url: "https://jsonplaceholder.typicode.com/comments") { (posts:[PostModel]?, comments:[CommentModel]?, error) in
            
            if let comments = comments{
                self.comments = comments
                //print(posts)
                self.tableView.reloadData()
                
            }else {
                
                
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = comments[indexPath.row].email

        return cell
    }
    


}
