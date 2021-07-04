//
//  StoryboardExtension.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/04.
//

import UIKit

extension UIStoryboard {
    static var barcodeReaderViewController: BarcodeReaderViewController {
        UIStoryboard.init(name: "BarcodeReader", bundle: nil).instantiateInitialViewController() as! BarcodeReaderViewController
    }
    
    static var resultImageViewController: ResultImageViewController {
        UIStoryboard.init(name: "ResultImage", bundle: nil).instantiateInitialViewController() as! ResultImageViewController
    }
}
