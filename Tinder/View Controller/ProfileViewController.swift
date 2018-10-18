//
//  ProfileViewController.swift
//  Tinder
//
//  Created by XiaoQian Huang on 10/17/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
     var profileImageViewHolder: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         profileImageView.image = profileImageViewHolder
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
