//
//  RewardsViewModel.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

final class RewardsViewModel: ObservableObject {
    private let clientsFabric: RewardsClientFabric
    
    @Published var cardNumber: String? = nil
    @Published var cardExpirationDate: Date? = nil
    @Published var currentBalance: Float? = nil
    @Published var transactions: [TransactionModel]? = nil
    
    @Published var isRefreshing: Bool = false
    @Published var isLoadingMore: Bool = false
    @Published var isAllLoaded: Bool = false
    @Published var transactionDetails: TransactionDetailsViewModel? = nil
    
    init(clientsFabric: RewardsClientFabric) {
        self.clientsFabric = clientsFabric
    }
    
    @MainActor
    func refresh() async {
        print("Refreshing...")
        isRefreshing = true
        isAllLoaded = false
        defer { isRefreshing = false }
        do {
            let rewards = try await clientsFabric.rewardsClient.fetch()
            currentBalance = rewards.balance
            cardNumber = rewards.cardNumber
            cardExpirationDate = rewards.cardExpirationDate
            transactions = rewards.transactions
                .unique(by: \.id)
        } catch is CancellationError {
            print("Info: Fetching rewards cancelled")
        } catch {
            print("Error fetching rewards: \(error)")
        }
    }
    
    @MainActor
    func loadMore() async {
        guard !isRefreshing, !isLoadingMore, !isAllLoaded else { return }
        print("Loading more...")
        isLoadingMore = true
        defer { isLoadingMore = false }
        do {
            transactions = try await clientsFabric.transactionsClient.fetch()
                .unique(by: \.id)
            isAllLoaded = true
        } catch is CancellationError {
            print("Info: Fetching all transactions cancelled")
        } catch {
            print("Error fetching all transactions: \(error)")
        }
    }
    
    func showTransaction(withId id: String) {
        transactionDetails = .init(transactionId: id,
                                   transactionClient: clientsFabric.transactionClient)
    }
}
