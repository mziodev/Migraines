//
//  MigrainesCalendarMonthUtilitiesTests.swift
//  MigrainesTests
//
//  Created by MZiO on 12/12/24.
//

import XCTest

@testable import Migraines

final class MigrainesCalendarMonthUtilitiesTests: XCTestCase {

    var calendar: Calendar!

    override func setUp() {
        super.setUp()
        calendar = Calendar.current
    }
    
    // MARK: - daysInMonth(of:year:) tests
    
    func testDaysInMonth_January() throws {
        let result = calendar.daysInMonth(of: 1, year: 2024)
        XCTAssertEqual(result.count, 31)
        XCTAssertEqual(result.first, "1")
        XCTAssertEqual(result.last, "31")
    }
    
    func testDaysInMonth_February_LeapYear() throws {
        let result = calendar.daysInMonth(of: 2, year: 2024)
        XCTAssertEqual(result.count, 29)
        XCTAssertEqual(result.first, "1")
        XCTAssertEqual(result.last, "29")
    }
    
    func testDaysInMonth_February_NotLeapYear() throws {
        let result = calendar.daysInMonth(of: 2, year: 2022)
        XCTAssertEqual(result.count, 28)
        XCTAssertEqual(result.first, "1")
        XCTAssertEqual(result.last, "28")
    }
    
    func testDaysInMonth_December() throws {
        let result = calendar.daysInMonth(of: 12, year: 2024)
        XCTAssertEqual(result.count, 31)
        XCTAssertEqual(result.first, "1")
        XCTAssertEqual(result.last, "31")
    }
    
    // MARK: - daysBeforeMonth(of:year:) tests
    
    func testDaysBeforeMonth_January() throws {
        let result = calendar.daysBeforeMonth(of: 1, year: 2024)
        XCTAssertEqual(result.count, 0)
    }
    
    func testDaysBeforeMonth_February() throws {
        let result = calendar.daysBeforeMonth(of: 2, year: 2024)
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result.first, "29")
        XCTAssertEqual(result.last, "31")
    }
    
    func testDaysBeforeMonth_March() throws {
        let result = calendar.daysBeforeMonth(of: 3, year: 2024)
        XCTAssertEqual(result.count, 4)
        XCTAssertEqual(result.first, "26")
        XCTAssertEqual(result.last, "29")
    }
    
    // MARK: - daysAfterMonth(of:year:) tests
    
    func testDaysAfterMonth_January() throws {
        let result = calendar.daysAfterMonth(of: 1, year: 2024)
        XCTAssertEqual(result.count, 4)
        XCTAssertEqual(result.first, "1")
        XCTAssertEqual(result.last, "4")
    }
    
    func testDaysAfterMonth_February() throws {
        let result = calendar.daysAfterMonth(of: 2, year: 2024)
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result.first, "1")
        XCTAssertEqual(result.last, "3")
    }
    
    func testDaysAfterMonth_December() throws {
        let result = calendar.daysAfterMonth(of: 12, year: 2024)
        XCTAssertEqual(result.count, 5)
        XCTAssertEqual(result.first, "1")
        XCTAssertEqual(result.last, "5")
    }
}
