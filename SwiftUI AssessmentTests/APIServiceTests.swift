//
//  APIServiceTests.swift
//  SwiftUI AssessmentTests
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import XCTest
@testable import SwiftUI_Assessment

final class APIServiceTests: XCTestCase {
    var apiService: APIService!

    override func setUpWithError() throws {
        apiService = APIService()
    }

    override func tearDownWithError() throws {
        apiService = nil
    }

    func testRewardsFetching() async throws {
        let _ = try await apiService.getRewards()
    }
    
    func testRransactionsFetching() async throws {
        let _ = try await apiService.getTransactions()
    }
    
    func testTransactionFetchingById() async throws {
        let transactions = try await apiService.getTransactions()
        XCTAssertGreaterThan(transactions.count, 0, "Backend responded with 0 transactions")
        guard transactions.count > 0 else { return }
        let firstTransactionId = transactions[0].id
        let _ = try await apiService.getTransaction(withId: firstTransactionId)
    }

}
