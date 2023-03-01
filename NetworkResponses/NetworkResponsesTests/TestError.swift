//
//  TestError.swift
//  NetworkResponsesTests
//
//  Created by Ayush Bhatt on 26/02/23.
//

import Foundation

struct TestError: LocalizedError{
    let message: String
    var errorDescription: String? {message}
}
