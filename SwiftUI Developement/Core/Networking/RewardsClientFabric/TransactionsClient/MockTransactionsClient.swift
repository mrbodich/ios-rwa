//
//  MockTransactionsClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct MockTransactionsClient: TransactionsClient {
    let delay: Float
    
    func fetch() async throws -> [TransactionModel] {
        try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        return Self.mockTransactions
    }
}

extension MockTransactionsClient {
    static var mockTransactions: [TransactionModel] {
        [
            .init(id: "N10D54V321",
                  title: "Starbucks",
                  date: TransactionModel.mockDate("2021-07-26"),
                  amount: -10.54,
                  bird: true,
                  status: "Completed"),
            .init(id: "P01D00V268",
                  title: "Alpha Bird - Math",
                  date: TransactionModel.mockDate("2021-07-24"),
                  amount: 1,
                  bird: true,
                  status: "Completed"),
            .init(id: "N24D61V816",
                  title: "Amazon.com",
                  date: TransactionModel.mockDate("2021-07-23"),
                  amount: -24.61,
                  bird: false,
                  status: "Completed")
        ]
    }
}
