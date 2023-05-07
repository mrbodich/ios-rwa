//
//  TransactionClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct RemoteTransactionClient: TransactionClient {
    func fetch(withId id: String) async throws -> TransactionModel {
        try await APIService().getTransaction(withId: id)
    }
}
