//
//  MarksAppTests.swift
//  MarksAppTests
//
//  Created for SE4041 Practical 04.
//

import XCTest
@testable import MarksApp

final class MarksAppTests: XCTestCase {

    func testStudentPassFailLogic() {
        let passingStudent = Student(name: "Amal", mark: 72)
        XCTAssertTrue(passingStudent.passed, "Mark 72 should pass")

        let failingStudent = Student(name: "Nimali", mark: 45)
        XCTAssertFalse(failingStudent.passed, "Mark 45 should fail")

        // Boundary tests
        let mark0 = Student(name: "Student 0", mark: 0)
        XCTAssertFalse(mark0.passed, "Mark 0 should fail")

        let mark49 = Student(name: "Student 49", mark: 49)
        XCTAssertFalse(mark49.passed, "Mark 49 should fail")

        let mark50 = Student(name: "Student 50", mark: 50)
        XCTAssertTrue(mark50.passed, "Mark 50 should pass")

        let mark100 = Student(name: "Student 100", mark: 100)
        XCTAssertTrue(mark100.passed, "Mark 100 should pass")
    }

    func testStudentGradeCalculation() {
        XCTAssertEqual(Student(name: "A", mark: 100).grade, "A")
        XCTAssertEqual(Student(name: "A", mark: 80).grade, "A")
        XCTAssertEqual(Student(name: "A-", mark: 79).grade, "A-")
        XCTAssertEqual(Student(name: "A-", mark: 75).grade, "A-")
        XCTAssertEqual(Student(name: "B+", mark: 74).grade, "B+")
        XCTAssertEqual(Student(name: "B+", mark: 70).grade, "B+")
        XCTAssertEqual(Student(name: "B", mark: 69).grade, "B")
        XCTAssertEqual(Student(name: "B", mark: 65).grade, "B")
        XCTAssertEqual(Student(name: "B-", mark: 64).grade, "B-")
        XCTAssertEqual(Student(name: "B-", mark: 60).grade, "B-")
        XCTAssertEqual(Student(name: "C+", mark: 59).grade, "C+")
        XCTAssertEqual(Student(name: "C+", mark: 55).grade, "C+")
        XCTAssertEqual(Student(name: "C", mark: 54).grade, "C")
        XCTAssertEqual(Student(name: "C", mark: 45).grade, "C")
        XCTAssertEqual(Student(name: "C-", mark: 44).grade, "C-")
        XCTAssertEqual(Student(name: "C-", mark: 40).grade, "C-")
        XCTAssertEqual(Student(name: "F", mark: 39).grade, "F")
        XCTAssertEqual(Student(name: "F", mark: 0).grade, "F")
    }
}
