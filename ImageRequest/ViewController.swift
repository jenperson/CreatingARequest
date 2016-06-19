//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Add all the networking code here!
        
        // display image is a cat
        let imageURL = NSURL(string: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg")!
        
        // create the task
        let task = NSURLSession.sharedSession().dataTaskWithURL(imageURL) { (data, response, error) in
            
            print("task finished")
            
            if error == nil{
                let downloadedImage = UIImage(data: data!)
                
                self.imageView.image = downloadedImage
            }
        }
        
        // begin task
        task.resume()
        
    }
}
