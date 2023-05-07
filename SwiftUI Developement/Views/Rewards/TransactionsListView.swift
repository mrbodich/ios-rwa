//
//  TransactionsListView.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import SwiftUI

struct TransactionsListView: View {
    let transactions: [TransactionModel]?
    private var _onSelect: ((_ transactionId: String) -> ())? = nil
    private var _onLastAppear: (() -> ())? = nil
    
    init(transactions: [TransactionModel]?) {
        self.transactions = transactions
    }
    
    var body: some View {
        switch transactions {
        case .some(let wrapped):
            ForEach(wrapped) { transaction in
                Button {
                    _onSelect?(transaction.id)
                } label: {
                    TransactionListItem(title: transaction.title,
                                        transactionDate: transaction.date,
                                        amount: transaction.amount,
                                        birdEarned: transaction.bird)
                    .contentShape(Rectangle())
                }
                .buttonStyle(ListRowButtonStyle())
                .onAppear {
                    if transaction.id == wrapped.last?.id {
                        _onLastAppear?()
                    }
                }
                .id(transaction.id)
            }
        case .none:
            TransactionListItem(title: "Transaction name",
                                transactionDate: Date(),
                                amount: 199.99,
                                birdEarned: false)
            .id("000")
            .redacted(reason: .placeholder)
        }
    }
    
    func onSelect(perform: @escaping (_ transactionId: String) -> ()) -> Self {
        var mutatingSelf = self
        mutatingSelf._onSelect = perform
        return mutatingSelf
    }
    
    func onLastAppear(perform: @escaping () -> ()) -> Self {
        var mutatingSelf = self
        mutatingSelf._onLastAppear = perform
        return mutatingSelf
    }
}

struct ListRowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.38 : 1)
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TransactionsListView(transactions: MockTransactionsClient.mockTransactions)
        }
        .exhaustivePreview()
    }
}
