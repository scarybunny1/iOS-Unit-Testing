//
//  ViewControllerTests.swift
//  TextFieldTests
//
//  Created by Ayush Bhatt on 06/03/23.
//

import XCTest
@testable import TextField

final class ViewControllerTests: XCTestCase {

    func test_outletsAreConnected(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.usernameField, "Username field")
        XCTAssertNotNil(sut.passwordField, "Password field")
    }
    
    func test_usernameField_attributesShouldBeSet(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        
        let textField = sut.usernameField!
        XCTAssertEqual(textField.autocorrectionType, .no, "autoCorrectionType")
        XCTAssertEqual(textField.textContentType, .username, "textContentType")
        XCTAssertEqual(textField.returnKeyType, .next, "returnKeyType")
    }
    
    func test_passwordField_attributesShouldBeSet(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        
        let textField = sut.passwordField!
        
        XCTAssertEqual(textField.textContentType, .password, "textContentType")
        XCTAssertEqual(textField.autocorrectionType, .no, "autoCorrectionType")
        XCTAssertEqual(textField.returnKeyType, .go, "returnKeyType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
    }
    
    func test_textFieldDelegates_shouldBeConnected(){
        let sut = make()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.usernameField.delegate, "Username field delegate")
        XCTAssertNotNil(sut.passwordField.delegate, "Password field delegate")
    }
    
    func test_shouldChangeCharacters_usernameWithSpaces_shouldPreventChange(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        let allowChange = shouldChangeCharacters(in: sut.usernameField, replacement: "a b c")
        
        XCTAssertEqual(allowChange, false)
    }

    func test_shouldChangeCharacters_usernameWithoutSpaces_shouldAllowChange(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        let allowChange = shouldChangeCharacters(in: sut.usernameField, replacement: "abc")
        
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldChangeCharacters_passwordWithSpaces_shouldAllowChange(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        let allowChange = shouldChangeCharacters(in: sut.passwordField, replacement: "a b c")
        
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldChangeCharacters_passwordWithoutSpaces_shouldAllowChange(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        let allowChange = shouldChangeCharacters(in: sut.passwordField, replacement: "abc")
        
        XCTAssertEqual(allowChange, true)
    }
    
    func test_shouldReturn_withPassword_shouldPerformLogin(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        sut.usernameField.text = "USERNAME"
        sut.passwordField.text = "PASSWORD"
        
        shouldReturn(in: sut.passwordField)
        
    }
    
    func test_shouldReturn_withUsername_shouldFocusInputToPasswordField(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        putInViewHierarchy(sut)
        shouldReturn(in: sut.usernameField)
        
        XCTAssertEqual(sut.passwordField.isFirstResponder, true)
        
        executeRunLoop()
    }
    
    func test_shouldReturn_withPassword_shouldDismissKeyboard(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        putInViewHierarchy(sut)
        sut.passwordField.becomeFirstResponder()
        
        XCTAssertEqual(sut.passwordField.isFirstResponder, true, "precondition")
        
        shouldReturn(in: sut.passwordField)
        
        XCTAssertEqual(sut.passwordField.isFirstResponder, false)
        
        executeRunLoop()
    }
    
    //MARK:  Helper
    
    func make() -> ViewController{
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        return sut
    }
    
    func putInViewHierarchy(_ vc: UIViewController){
        let window = UIWindow()
        window.addSubview(vc.view)
    }
    
    func executeRunLoop(){
        RunLoop.current.run(until: Date())
    }
}
