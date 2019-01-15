//
//  EightBallViewController.swift
//  Magic8Ball
//
//  Created by Seth Danner on 9/21/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class EightBallViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var ballImageView: UIImageView!
    
    var ballImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballImages = createImageArray(total: 8, imagePrefix: "MEB")
        
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            print(imageName)
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        
        imageView.animationImages = images
        imageView.animationDuration = 0.75
        imageView.animationRepeatCount = 3
        imageView.startAnimating()
    }
    
    @IBAction func ballButtonTapped(_ sender: UIButton) {
        
        animate(imageView: ballImageView, images: ballImages)
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        animate(imageView: ballImageView, images: ballImages)
    }
}
