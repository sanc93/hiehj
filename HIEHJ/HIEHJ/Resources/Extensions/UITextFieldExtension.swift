//
//  UITextFieldExtension.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/29.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
