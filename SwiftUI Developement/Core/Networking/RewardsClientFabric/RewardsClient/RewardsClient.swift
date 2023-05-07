//
//  RewardsClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

protocol RewardsClient {
    func fetch() async throws -> RewardsModel
}
