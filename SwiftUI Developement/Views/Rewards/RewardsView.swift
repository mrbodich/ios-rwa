//
//  RewardsView.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import SwiftUI

struct RewardsView: View {
    @StateObject var viewModel: RewardsViewModel
    
    init(clientFabric: RewardsClientFabric) {
        _viewModel = StateObject(wrappedValue: .init(clientsFabric: clientFabric))
    }
    
    var body: some View {
        NavigationView {
            List {
                CreditCardView(cardNumber: viewModel.cardNumber ?? "9999",
                               expirationDate: viewModel.cardExpirationDate ?? Date())
                .redacted(reason: viewModel.cardNumber == nil || viewModel.cardExpirationDate == nil ? .placeholder : [])
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)

                Section {
                    CurrentBalance(date: viewModel.cardExpirationDate ?? Date(),
                                   balance: viewModel.currentBalance ?? 199.99)
                    .redacted(reason: viewModel.cardExpirationDate == nil || viewModel.currentBalance == nil ? .placeholder : [])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                } header: {
                    CommonComponents.sectionHeader("Current Balance")
                }
                .listRowBackground(ThemeColor.listRow)

                Section {
                    TransactionsListView(
                        transactions: viewModel.transactions
                    )
                    .onSelect { transactionId in
                        viewModel.showTransaction(withId: transactionId)
                    }
                    .onLastAppear {
                        guard !viewModel.isRefreshing, !viewModel.isAllLoaded, viewModel.transactions != nil else { return }
                        Task {
                            await viewModel.loadMore()
                        }
                    }
                    .frame(height: 57)
                } header: {
                    CommonComponents.sectionHeader("Latest Transactions")
                }
                .listRowBackground(ThemeColor.listRow)
                
                Section {
                } header: {
                    Color.clear
                        .frame(height: 30)
                        .overlay {
                            if viewModel.isLoadingMore {
                                ProgressView()
                                    .progressViewStyle(.circular)
                            }
                        }
                }
            }
            .listStyle(.insetGrouped)
            .setupListStyle()
            .refreshable {
                guard !viewModel.isRefreshing else { return }
                await viewModel.refresh()
            }
            .onAppear {
                guard !viewModel.isRefreshing, viewModel.transactions == nil else { return }
                Task.detached {
                    await viewModel.refresh()
                }
            }
            .navigationTitle("Rewards")
            .navigation(item: $viewModel.transactionDetails) { viewModel in
                TransactionDetailsView(viewModel: viewModel)
            }
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView(clientFabric: MockRewardsClientFabric(delay: 1.5))
            .exhaustivePreview()
    }
}
