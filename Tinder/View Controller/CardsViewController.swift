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
    var divisor: CGFloat!
    
    @IBOutlet weak var cardImageView: UIImageView!
    var fadeTransition: FadeTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        divisor = (view.frame.width / 2) / 0.61
        cardInitialCenter = cardImageView.center
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    
        let imageView = sender.view as! UIImageView
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        let xFromCenter = imageView.center.x - view.center.x
        
        imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
        
        if location.y < cardInitialCenter.y {
            imageView.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
        } else {
            imageView.transform = CGAffineTransform(rotationAngle: xFromCenter / -divisor)
        }
        
        if sender.state == .began {
            print("Pan begin")
        } else if sender.state == .changed {
            print("Pan changing")
            
        } else if sender.state == .ended {
            print("end pan")
            if imageView.center.x < cardInitialCenter.x - 50 {
                //animate to the right
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
                    imageView.alpha = 0
                })
            } else if imageView.center.x > cardInitialCenter.x + 50 {
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x + 500, y: imageView.center.y)
                    imageView.alpha = 0
                })
            } else {
                imageView.center = cardInitialCenter
                imageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let dest = segue.destination as? ProfileViewController {
            dest.modalPresentationStyle = UIModalPresentationStyle.custom
            fadeTransition = FadeTransition()
            dest.transitioningDelegate = fadeTransition
            fadeTransition.duration = 1.0
            dest.profileImageViewHolder = cardImageView.image
        }
    }
    
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ProfileModal", sender: nil)
    }
}
