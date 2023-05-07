//
//  MockRewardsClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct MockRewardsClient: RewardsClient {
    let delay: Float
    
    func fetch() async throws -> RewardsModel {
        try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        let tansactions = try await MockTransactionsClient(delay: 0).fetch()
        return .init(
            cardNumber: "0991",
            cardExpirationDate: RewardsModel.mockDate("2023-12"),
            balance: 179.47,
            transactions: tansactions
        )
    }
}
