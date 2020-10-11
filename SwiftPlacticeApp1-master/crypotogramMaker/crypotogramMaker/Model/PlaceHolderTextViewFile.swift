//
//  PlaceHolderTextViewFile.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/20.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

@IBDesignable class PlaceHolderTextView: UITextView {
    
    //セルフチェックのフラグ
    var placeHolderflag = 0

    // MARK: Stored Instance Properties

    @IBInspectable private var placeHolder: String = "" {
        willSet {
            self.placeHolderLabel.text = newValue
            self.placeHolderLabel.sizeToFit()
        }
    }

    private lazy var placeHolderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 6.0, y: 10.0, width: 0.0, height: 0.0))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = self.font
        label.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)
        label.backgroundColor = .clear
        self.addSubview(label)
        return label
    }()

    // MARK: Initializers

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: View Life-Cycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        changeVisiblePlaceHolder()
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }

    // MARK: Other Private Methods

    
    private func changeVisiblePlaceHolder() {
        //selfCheckボタンが押されたことを感知するためにをuserdefaultに保存
        placeHolderflag = UserDefaults.standard.integer(forKey: "placeHolderflag")
        if placeHolderflag == 1 {
            self.placeHolderLabel.alpha = 0.0
        } else {
        self.placeHolderLabel.alpha = (self.placeHolder.isEmpty || !self.text.isEmpty) ? 0.0 : 1.0
        }
    }

    @objc private func textChanged(notification: NSNotification?) {
        changeVisiblePlaceHolder()
    }

}
