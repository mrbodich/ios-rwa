import SwiftUI

struct CurrentBalance: View {
	var date: Date
	var balance: Float

	var body: some View {
		VStack(alignment: .leading) {
			Text("Balance as of \(date.format())")
				.foregroundColor(Color(.systemGray))
			Text("$139.47")
				.bold()
				.font(.title)
		}
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.all, 12)
        .cornerRadius(12)
    }
}

struct CurrentBalance_Previews: PreviewProvider {
	static var previews: some View {
        CurrentBalance(
            date: Date.now,
            balance: 139.47
        )
        .exhaustivePreview()
	}
}
