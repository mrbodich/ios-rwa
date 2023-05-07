//
//  TransactionModel.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct TransactionModel: Identifiable, Decodable {
    let id: String
    let title: String
    let date: Date
    let amount: Float
    let bird: Bool
    let status: String?
}

extension TransactionModel {
    static func mockDate(_ dateString: String) -> Date {
        .init(dateString, format: "yyyy-MM-dd")!
    }
}
