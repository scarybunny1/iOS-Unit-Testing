//
//  TestHelpers.swift
//  TextFieldTests
//
//  Created by Ayush Bhatt on 07/03/23.
//

import UIKit

func shouldChangeCharacters(in textField: UITextField, range: NSRange = NSRange(), replacement: String) -> Bool?{
    textField.delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: replacement)
}

@discardableResult func shouldReturn(in textField: UITextField) -> Bool{
    return (textField.delegate?.textFieldShouldReturn?(textField) ?? false)
}
