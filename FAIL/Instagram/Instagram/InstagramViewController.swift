//
//  InstagramViewController.swift
//  Instagram
//
//  Created by Gerardo Vazquez on 2/29/16.
//  Copyright © 2016 Gerardo Vazquez. All rights reserved.
//

import UIKit
import Parse

class InstagramViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts: NSArray?
    @IBOutlet weak var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onLogout(sender: AnyObject) {
        // PFUser.currentUser() will now be nil
        PFUser.logOut()
        print("User Logout successfully")
        
        // post to listener
        NSNotificationCenter.defaultCenter().postNotificationName("userDidLogoutNotification", object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCellWithIdentifier("POST", forIndexPath: indexPath) as! PostsTableViewCell
        cell.picture = posts![indexPath.row]["media"] as? PFFile
        cell.caption = posts![indexPath.row]["caption"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
