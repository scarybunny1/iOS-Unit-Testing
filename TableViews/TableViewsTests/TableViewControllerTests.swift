//
//  TableViewControllerTests.swift
//  TableViewsTests
//
//  Created by Ayush Bhatt on 09/03/23.
//

import XCTest
@testable import TableViews

final class TableViewControllerTests: XCTestCase {
    
    func test_tableViewDelegates_shouldBeConnected(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
        XCTAssertNotNil(sut.tableView.dataSource, "datasource")
    }
    
    func test_numberOfRows_shouldBe3(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numberOfRows(in: sut.tableView), 3)
    }
    
    func test_cellForRowAt_withRow0_shouldShowCellWithLabelTextAsOne(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        let cell = cellForRowAtIndexPath(in: sut.tableView, row: 0)
        
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }
    
    func test_cellForRowAt_withRow1_shouldShowCellWithLabelTextAsTwo(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        let cell = cellForRowAtIndexPath(in: sut.tableView, row: 1)
        
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func test_cellForRowAt_withRow2_shouldShowCellWithLabelTextAsThree(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        let cell = cellForRowAtIndexPath(in: sut.tableView, row: 2)
        
        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }
    
    func test_didSelectRow_atRow0_shouldPrintOne(){
        let sut = make()
        
        sut.loadViewIfNeeded()
        
        
        //assert something
    }
    
    //MARK:  Helper Functions
    func make() -> TableViewController{
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: TableViewController = sb.instantiateViewController(identifier: String(describing: TableViewController.self))
        return sut
    }
    
    func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int?{
        tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func cellForRowAtIndexPath(in tableView: UITableView, section: Int = 0, row: Int) -> UITableViewCell?{
        tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row, section: section))
    }
    
    func didSelectCellAtIndexPath(in tableView: UITableView, row: Int, section: Int = 0){
        tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: section))
    }
}
