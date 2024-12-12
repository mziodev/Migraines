//
//  MigrainesDateMonthUtilitiesTests.swift
//  MigrainesTests
//
//  Created by MZiO on 12/12/24.
//

import XCTest

@testable import Migraines

final class MigrainesDateMonthUtilitiesTests: XCTestCase {

    func testComputedProperties() throws {
        let date = Date(timeIntervalSince1970: 1643723400) // February 1, 2022, 12:00:00 UTC
        
        XCTAssertEqual(date.day, 1)
        XCTAssertEqual(date.weekday, 2) // Tuesday, 2th if the locale is using Monday as a first weekday
        XCTAssertEqual(date.month, 2)
        XCTAssertEqual(date.year, 2022)
    }
    
    func testFirstDayOfMonth() throws {
        do {
            let date = try Date.firstDay(of: 2, year: 2024)
            XCTAssertEqual(date.day, 1)
            XCTAssertEqual(date.month, 2)
            XCTAssertEqual(date.year, 2024)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testFirstDayOfMonth_InvalidMonth() {
        XCTAssertThrowsError(try Date.firstDay(of: 13, year: 2022)) { error in
            XCTAssertEqual(error as? DateError, DateError.invalidMonth)
        }
    }
    
    func testLastDayOfMonth() {
        do {
            let date = try Date.lastDay(of: 2, year: 2024)
            
            XCTAssertEqual(date.day, 29)
            XCTAssertEqual(date.month, 2)
            XCTAssertEqual(date.year, 2024)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testLastDayOfMonth_FebruaryLeapYear() {
        do {
            let date = try Date.lastDay(of: 2, year: 2022)
            
            XCTAssertEqual(date.day, 28)
            XCTAssertEqual(date.month, 2)
            XCTAssertEqual(date.year, 2022)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testLastDayOfMonth_December() {
        do {
            let date = try Date.lastDay(of: 12, year: 2024)
            
            XCTAssertEqual(date.day, 31)
            XCTAssertEqual(date.month, 12)
            XCTAssertEqual(date.year, 2024)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
