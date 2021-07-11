//
//  ImageViewAtCodeViewController.swift
//  GetImageSampleApp
//
//  Created by Oh!ara on 2021/07/10.
//

import UIKit

class ImageViewAtCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpImage()
    }
    

    
    func setUpImage()  {
        
        let myUrl = URL(string: "https://books.google.com/books/content?id=hsFCMQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api")
        var myImage:UIImage?
        
        do {
            let data = try Data(contentsOf: myUrl!)
            myImage = UIImage(data: data)
        } catch let error {
            print("error: \(error)")
        }
        let imageView = UIImageView()
        
        // imageViewの大きさを指定
        let rect: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        imageView.frame = rect
        
//        imageView.image = UIImage(named: "catIcon4")
        imageView.image = myImage
        
        
        self.view.addSubview(imageView)
    }
}
