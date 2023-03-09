//
//  HelperExtensions.swift
//  TextFieldTests
//
//  Created by Ayush Bhatt on 06/03/23.
//

import Foundation
import UIKit

extension UITextAutocorrectionType: CustomStringConvertible{
    public var description: String {
        switch self{
        case .default:
            return "default"
        case .yes:
            return "yes"
        case .no:
            return "no"
        @unknown default:
            fatalError("Unknown type")
        }
    }
}

extension UITextContentType: CustomStringConvertible{
    public var description: String {
        return self.rawValue
    }
}

extension UIReturnKeyType: CustomStringConvertible{
    public var description: String {
        switch self{
        case .default:
            return "default"
        case .go:
            return "go"
        case .google:
            return "google"
        case .join:
            return "join"
        case .next:
            return "next"
        case .route:
            return "route"
        case .search:
            return "search"
        case .send:
            return "send"
        case .yahoo:
            return "yahoo"
        case .done:
            return "done"
        case .emergencyCall:
            return "emergencyCall"
        case .continue:
            return "continue"
        @unknown default:
            fatalError("Unknown type")
        }
    }
}
