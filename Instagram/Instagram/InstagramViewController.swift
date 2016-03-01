//
//  InstagramViewController.swift
//  Instagram
//
//  Created by Gerardo Vazquez on 2/29/16.
//  Copyright © 2016 Gerardo Vazquez. All rights reserved.
//

import UIKit
import Parse

class InstagramViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
