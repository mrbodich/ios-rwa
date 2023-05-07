//
//  TransactionDetailsViewModel.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

final class TransactionDetailsViewModel: ObservableObject, Identifiable {
    let id: String
    private let client: TransactionClient
    
    @Published var title: String? = nil
    @Published var amount: Float? = nil
    @Published var isBird: Bool? = nil
    @Published var status: String? = nil
    @Published var date: Date? = nil
    
    @Published var isRefreshing: Bool = false
    
    init(transactionId id: String, transactionClient: TransactionClient) {
        self.id = id
        self.client = transactionClient
    }
    
    @MainActor
    func refresh() async {
        guard !isRefreshing else { return }
        isRefreshing = true
        defer { isRefreshing = false }
        do {
            let transaction = try await client.fetch(withId: id)
            title = transaction.title
            amount = transaction.amount
            isBird = transaction.bird
            status = transaction.status
            date = transaction.date
        } catch is CancellationError {
            print("Info: Fetching transaction cancelled")
        } catch {
            print("Error fetching transaction: \(error)")
        }
    }
}
