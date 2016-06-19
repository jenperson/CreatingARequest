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
        let imageURL = NSURL(string: "http://i.amz.mshcdn.com/KRUEW_Zm_0UvTD97QnKID9MUqmk=/150x150/2012%2F12%2F04%2Fd0%2Fcat.c4A")!
        
        // create the task
        let task = NSURLSession.sharedSession().dataTaskWithURL(imageURL) { (data, response, error) in
            
            // this part isn't really necessary but shows status in output for the purposes of practice
            print("task finished")
            
            // show image if no error is found
            if error == nil {
                let downloadedImage = UIImage(data: data!)
                
                // refresh the status to load image in foreground
                performUIUpdatesOnMain {
                    self.imageView.image = downloadedImage
                }
            }
        }
        
        // begin task
        task.resume()
        
    }
}
