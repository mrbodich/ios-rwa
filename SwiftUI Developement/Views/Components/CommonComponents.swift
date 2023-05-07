//
//  CommonComponents.swift
//  SwiftUI Developement
//
//  Created by Bogdan Chornobryvets on 06.05.2023.
//

import SwiftUI

struct CommonComponents {
    static func sectionHeader(_ text: String) -> some View {
        Text(text)
            .bold()
            .font(.title3)
            .textCase(nil)
            .foregroundColor(ThemeColor.listRowText)
            .offset(x: -20)
    }
}

struct CommonComponents_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 10) {
            CommonComponents.sectionHeader("Header Name")
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
