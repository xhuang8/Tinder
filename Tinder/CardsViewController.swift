//
//  CardsViewController.swift
//  Tinder
//
//  Created by XiaoQian Huang on 10/12/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardInitialCenter = cardImageView.center
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    }
    
}
