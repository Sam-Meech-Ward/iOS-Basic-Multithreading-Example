//
//  ViewController.swift
//  Multi
//
//  Created by Sam Meech-Ward on 2020-05-23.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func randomImage(_ sender: Any) {
    let url = URL(string: "https://loremflickr.com/2000/2000")!
    let task = URLSession.shared.downloadTask(with: url) { (localUrl, response, error) in
      
      let data = try! Data(contentsOf: localUrl!)
      let image = UIImage(data: data)
      
      DispatchQueue.main.async {
        self.imageView.image = image
      }
    }
    task.resume()
    
  }
  
}

