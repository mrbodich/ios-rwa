import SwiftUI

struct TransactionDetail: View {
    let title: String?
    let amount: Float?
    let isBird: Bool?
    
    var body: some View {
		VStack(alignment: .center) {
            Image(isBird == true ? "Bird" :"Outflow")
			Text(title ?? "Transaction")
            Text(String(format: "$%.2f", amount ?? 199.99).replacingOccurrences(of: "$-", with: "-$"))
				.bold()
				.font(.title)
            Text("Congratulations on earning your bird!")
                .font(.footnote)
                .foregroundColor(Color(.systemGray))
                .opacity(isBird == true ? 1 : 0)
		}
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 32)
//        .background(Color(.systemGray6))
        .cornerRadius(12)
        .redacted(reason: title == nil || amount == nil || isBird == nil ? .placeholder : [])
    }
}

struct TransactionDetail_Previews: PreviewProvider {
	static var previews: some View {
        VStack {
            TransactionDetail(title: "Starbucks",
                              amount: -10.45,
                              isBird: true)
            TransactionDetail(title: "McDonalds",
                              amount: 12.15,
                              isBird: false)
        }
        .exhaustivePreview()
	}
}
