//
//  RemoteRewardsClientFabric.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct RemoteRewardsClientFabric: RewardsClientFabric {
    var rewardsClient: RewardsClient {
        RemoteRewardsClient()
    }
    
    var transactionsClient: TransactionsClient {
        RemoteTransactionsClient()
    }
    
    var transactionClient: TransactionClient {
        RemoteTransactionClient()
    }
}
