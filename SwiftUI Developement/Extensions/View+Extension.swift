//
//  View+Extension.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import Foundation
import SwiftUI

extension View {
    func exhaustivePreview() -> some View {
        let typeSizes: [DynamicTypeSize] = [
            .large,
            .xSmall,
            .xxxLarge
        ]
        return Group {
            ForEach(typeSizes, id: \.self) { size in
                self
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            self
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }
        .previewLayout(.sizeThatFits)
    }
    
    func setupListStyle() -> some View {
        if #available(iOS 16, *) {
            return self
                .scrollContentBackground(.hidden)
                .background(ThemeColor.listBackground)
        } else {
            return self
                .onAppear {
                    UITableView.appearance().backgroundColor = ThemeColor.uikitListBackground
                }
        }
    }
}
