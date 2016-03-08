
import UIKit
import Parse
import ParseUI

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!){
            (user: PFUser?, error: NSError?) -> Void in
        
        if user != nil {
            print(" You are logged in")
        //here is to direct the user directly to the homeViewController
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            
            
            let vc: AnyObject? = self.storyboard?.instantiateViewControllerWithIdentifier("postsController")
            self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
            
            }
        }
    }
    

    @IBAction func onSignUp(sender: AnyObject) {
        
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text

        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("Yay, created a user!")
                 self.performSegueWithIdentifier("loginSegue", sender: nil) 
                
                } else {
                print(error?.localizedDescription)
                if error?.code == 202 {
                    print("Username is taken")
                }
        
            }
        }
    }
    
}
