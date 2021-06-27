//
//  TakePhotoViewController.swift
//  PhotoARSampleApp
//
//  Created by 尾原徳泰 on 2021/06/27.
//

import UIKit



class TakePhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func takePhotoButtonAction(_ sender: Any) {
    }
    
    
    func launchCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        // カメラ起動
        present(picker, animated: true, completion: nil)
    }
    
    // シャッターボタン押した後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        // イメージの保存
        UserDefaults.standard.setValue(image, forKey: "photo")
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
}
