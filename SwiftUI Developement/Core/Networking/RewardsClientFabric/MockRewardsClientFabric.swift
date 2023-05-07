//
//  MockRewardsClientFabric.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct MockRewardsClientFabric: RewardsClientFabric {
    let delay: Float
    
    var rewardsClient: RewardsClient {
        MockRewardsClient(delay: delay)
    }
    
    var transactionsClient: TransactionsClient {
        MockTransactionsClient(delay: delay)
    }
    
    var transactionClient: TransactionClient {
        MockTransactionClient(delay: delay)
    }
}
