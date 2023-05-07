//
//  RemoteRewardsClient.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation

struct RemoteRewardsClient: RewardsClient {
    func fetch() async throws -> RewardsModel {
        try await APIService().getRewards()
    }
}
