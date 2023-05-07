import SwiftUI

struct TransactionListItem: View {
	var title: String;
	var transactionDate: Date;
	var amount: Float;
	var birdEarned: Bool?;

    var body: some View {
		HStack(alignment: .top, spacing: 8) {
			VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .bold()
                        .truncationMode(.middle)
                        .lineLimit(1)
                    if birdEarned == true {
                        Image("BirdSmall")
                    }
                }
				Text(transactionDate, format: .dateTime.day().month().year())
					.font(.subheadline)
			}
			Spacer()
            HStack(spacing: 10) {
                Text(String(format: "$%.2f", amount).replacingOccurrences(of: "$-", with: "-$"))
                    .font(.headline)
                    .bold()
                Image("ArrowRight")
            }
		}
        .foregroundColor(ThemeColor.listRowText)
        .frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        TransactionListItem(
            title: "Starbucks Testing Long Item",
            transactionDate: Date.now,
            amount: 10.54
        )
        .exhaustivePreview()
    }
}
