//
//  UserDetailViewController.swift
//  IOSTraining
//
//  Created by VIETLAMTR on 23/02/2566 BE.
//

import UIKit

class UserDetailViewController: UIViewController {


    @IBOutlet weak var decription: UITextView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(url: URL(string: user.avatar_url))
        name?.text = user.login
        decription.text = user.html_url
 
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
