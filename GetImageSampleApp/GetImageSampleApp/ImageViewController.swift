//
//  ImageViewController.swift
//  GetImageSampleApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var sampleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setImage()
    }
    

    func setImage() {
        let myUrl = URL(string: "https://books.google.com/books/content?id=hsFCMQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")
        
        do {
            let data = try Data(contentsOf: myUrl!)
            sampleImageView.image = UIImage(data: data)
        } catch let error {
            print("error: \(error)")
        }
    }
    

}
