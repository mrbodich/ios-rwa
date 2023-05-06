import SwiftUI

struct TransactionDetail: View {
    var body: some View {
		VStack(alignment: .center) {
			Image("Outflow")
			Text("Starbucks")
			Text("-$10.54")
				.bold()
				.font(.title)
			Text("Congratulations on earning your bird!")
				.font(.footnote)
				.foregroundColor(Color(.systemGray))
		}.padding()
			.background(Color(.systemGray6))
			.cornerRadius(12)
    }
}

struct TransactionDetail_Previews: PreviewProvider {
	static let typeSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	]

	static var previews: some View {
		Group {
			ForEach(typeSizes, id: \.self) { size in
				TransactionDetail()
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			TransactionDetail()
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
	}
}
