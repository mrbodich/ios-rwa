//
//  MockTransactionClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct MockTransactionClient: TransactionClient {
    let delay: Float
    
    func fetch(withId id: String) async throws -> TransactionModel {
        try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        return .init(id: "N10D54V321",
                     title: "Starbucks",
                     date: TransactionModel.mockDate("2021-07-26"),
                     amount: -10.54,
                     bird: true,
                     status: "Completed")
    }
}
