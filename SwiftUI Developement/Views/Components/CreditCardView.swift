//
//  CreditCardView.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import SwiftUI

struct CreditCardView: View {
    private let initialCardWidth: CGFloat = 400
    private let ratio: CGFloat = 1.58
    
    let cardNumber: String
    let expirationDate: Date
    
    var body: some View {
        GeometryReader { proxy in
            let scaleFactor = proxy.size.width / initialCardWidth
            
            VStack(alignment: .leading, spacing: 0) {
                Image("AlphaLogo")
                Spacer(minLength: 0)
                Spacer(minLength: 0)
                Spacer(minLength: 0)
                Text("**** \(cardNumber)")
                    .bold()
                    .font(.title)
                    .tracking(2)
                Spacer(minLength: 0)
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Expiration Date")
                            .font(.caption)
                        Text(formattedDate(expirationDate))
                            .bold()
                            .font(.body)
                    }
                    Spacer(minLength: 0)
                    Image("Visa")
                }
            }
            .foregroundColor(.white)
            .padding(12)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(ratio, contentMode: .fit)
            .frame(width: initialCardWidth, height: initialCardWidth / ratio)
            .background(Image("CreditCardBackground").resizable())
            .cornerRadius(12)
            .scaleEffect(scaleFactor, anchor: .topLeading)
        }
        .aspectRatio(ratio, contentMode: .fit)
        .environment(\.dynamicTypeSize, .large) //Fixed size for later scaling
    }
    
    private func formattedDate(_ date: Date) -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM/yy"
        return outputFormatter.string(from: date)
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12) {
            CreditCardView(cardNumber: "9901", expirationDate: RewardsModel.mockDate("2023-12"))
            CreditCardView(cardNumber: "4545", expirationDate: RewardsModel.mockDate("2024-07"))
                .padding(.horizontal, 16)
            CreditCardView(cardNumber: "1207", expirationDate: RewardsModel.mockDate("2030-05"))
                .padding(.horizontal, 48)
        }
        .exhaustivePreview()
    }
}
