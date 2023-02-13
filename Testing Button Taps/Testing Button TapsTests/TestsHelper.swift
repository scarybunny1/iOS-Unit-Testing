//
//  TestsHelper.swift
//  Testing Button TapsTests
//
//  Created by Ayush Bhatt on 11/02/23.
//

import UIKit

func tap(_ button: UIButton){
    button.sendActions(for: .touchUpInside)
}
