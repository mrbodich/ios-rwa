//
//  RemoteTransactionsClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct RemoteTransactionsClient: TransactionsClient {
    func fetch() async throws -> [TransactionModel] {
        try await APIService().getTransactions()
    }
}
