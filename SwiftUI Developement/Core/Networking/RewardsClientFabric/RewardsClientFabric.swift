//
//  RewardsClientFabric.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

protocol RewardsClientFabric {
    var rewardsClient: RewardsClient { get }
    var transactionsClient: TransactionsClient { get }
    var transactionClient: TransactionClient { get }
}
