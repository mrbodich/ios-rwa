//
//  TransactionDetailsView.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import SwiftUI

struct TransactionDetailsView: View {
    @ObservedObject var viewModel: TransactionDetailsViewModel
    
    var body: some View {
        List {
            TransactionDetail(title: viewModel.title,
                              amount: viewModel.amount,
                              isBird: viewModel.isBird ?? false)
            .listRowBackground(ThemeColor.listRow)
            
            Section {
                KeyValueListItem(
                    key: "Status",
                    value: viewModel.status
                )
                KeyValueListItem(
                    key: "Date",
                    value: formattedDate(viewModel.date)
                )
            } header: {
                CommonComponents.sectionHeader("Transaction Details")
            }
            .listRowBackground(ThemeColor.listRow)
        }
        .setupListStyle()
        .task {
            await viewModel.refresh()
        }
    }
    
    private func formattedDate(_ date: Date?) -> String? {
        guard let date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
}

struct TransactionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailsView(viewModel: .init(transactionId: "000",
                                                transactionClient: MockTransactionClient(delay: 1)))
        .exhaustivePreview()
    }
}
