//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by Ayush Bhatt on 14/02/23.
//

import UIKit
import XCTest
import ViewControllerPresentationSpy
@testable import Navigation

final class ViewControllerTests: XCTestCase {
    
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }

    func test_tappingCodePushButton_navigatesToCodeNextViewController(){
        let nc = UINavigationController(rootViewController: sut)
        tap(sut.codePushButton)
        executeRunLoop()
        
        XCTAssertEqual(nc.viewControllers.count, 2)
        
        let pushedVC = nc.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else{
            XCTFail("Expected CodeNextViewController, but got \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed using code push button")
    }
    
    func test_INCORRECT_tappingCodeModalButton_shouldPresentCodeNextVC(){
        
        UIApplication.shared.windows.first?.rootViewController = sut
        
        tap(sut.codeModalButton)
        
        let presentedVC = sut.presentedViewController
        guard let codeNextVC = presentedVC as? CodeNextViewController else{
            XCTFail("Expected CodeNextViewController, but got \(String(describing: presentedVC))")
            return
        }
        
        XCTAssertEqual(codeNextVC.label.text, "Presented using code modal button")
    }
    
    @MainActor func test_tappingOnCodeModalButton_shouldPresentCodeNextVC(){
        let verifier = PresentationVerifier()
        tap(sut.codeModalButton)
        let codeNextVC: CodeNextViewController? = verifier.verify(animated: true, presentingViewController: sut)
        
        XCTAssertEqual(codeNextVC?.label.text, "Presented using code modal button")
    }
    
    @MainActor func test_tappingSeguePushButton_shouldShowSegueNextVC(){
        let verifier = PresentationVerifier()
        putInWindow(sut)
        tap(sut.seguePushButton)
        let segueNextVC: SegueNextViewController? = verifier.verify(animated: true, presentingViewController: sut)
        
        XCTAssertEqual(segueNextVC?.label.text, "Pushed using segue push button")
    }
    
    @MainActor func test_tappingSegueModalButton_shouldPresentSegueNextVC(){
        let verifier = PresentationVerifier()
        
        tap(sut.segueModalButton)
        let segueNextVC: SegueNextViewController? = verifier.verify(animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.label.text, "Presented using segue modal button")
    }
    
    //MARK:  Test Helper
    func executeRunLoop(){
        RunLoop.current.run(until: Date())
    }
    
    func tap(_ button: UIButton){
        button.sendActions(for: .touchUpInside)
    }
    
    func putInWindow(_ vc: UIViewController){
        let window = UIWindow()
        window.rootViewController = vc
        window.isHidden = false
    }
}
