//
//  RewardsModel.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct RewardsModel {
    let cardNumber: String
    let cardExpirationDate: Date
    let balance: Float
    let transactions: [TransactionModel]
}

extension RewardsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case cardNumber
        case cardExpirationDate
        case balance
        case transactions
    }

    init(from decoder: Decoder) throws {
        func jsonDecoder(_ format: String) -> JSONDecoder {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            return decoder
        }

        let container = try decoder.container(keyedBy: CodingKeys.self)
        cardNumber = try container.decode(String.self, forKey: .cardNumber)
        balance = try container.decode(Float.self, forKey: .balance)
        transactions = try container.decode([TransactionModel].self, forKey: .transactions)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let dateString = try container.decode(String.self, forKey: .cardExpirationDate)
        guard let date = dateFormatter.date(from: dateString) else {
            throw DecodingError.typeMismatch(Date.self, DecodingError.Context.init(codingPath: [], debugDescription: "Failed to decode cardExpirationDate"))
        }
        cardExpirationDate = date
    }

}

extension RewardsModel {
    static func mockDate(_ dateString: String) -> Date {
        .init(dateString, format: "yyyy-MM")!
    }
}
