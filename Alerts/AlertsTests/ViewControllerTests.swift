//
//  ViewControllerTests.swift
//  AlertsTests
//
//  Created by Ayush Bhatt on 13/02/23.
//

import XCTest
import ViewControllerPresentationSpy
@testable import Alerts

class ViewControllerTests: XCTestCase{
    
    private var sut: ViewController!
    private var alertVerifier: AlertVerifier!
    
    @MainActor override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        alertVerifier = AlertVerifier()
    }
    
    override func tearDown() {
        sut = nil
        alertVerifier = nil
        super.tearDown()
    }
    
    func test_buttonOutletConnected(){
        XCTAssertNotNil(sut.button)
    }
    
    @MainActor func test_buttonTap_shouldShowAlert(){
        sut.button.sendActions(for: .touchUpInside)
        
        alertVerifier.verify(title: "Alert", message: "This is an alert", animated: true, actions: [
            .default("Okay"),
            .cancel("Cancel")
        ], presentingViewController: sut)
        
        XCTAssertEqual(alertVerifier.preferredAction?.title, "Okay", "Preferred Action")
    }
    
    @MainActor func test_executeAlertAction_withOkayButton() throws{
        sut.button.sendActions(for: .touchUpInside)
        
        try alertVerifier.executeAction(forButton: "Okay")
    }
    
    @MainActor func test_executeAlertAction_withCancelButton() throws{
        sut.button.sendActions(for: .touchUpInside)
        
        try alertVerifier.executeAction(forButton: "Cancel")
    }
}
