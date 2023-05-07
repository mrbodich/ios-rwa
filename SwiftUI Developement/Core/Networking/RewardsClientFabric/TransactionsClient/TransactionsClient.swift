//
//  TransactionsClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

protocol TransactionsClient {
    func fetch() async throws -> [TransactionModel]
}
