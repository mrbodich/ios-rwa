import SwiftUI
import Combine

struct Account: View {
	@ObservedObject private var model = AccountViewModel()

	var body: some View {
		NavigationView {
			VStack(alignment: .leading, spacing: 12) {
				List() {
					Section {
						UserInfoItem(account: model.account)
					}
					Section {
						KeyValueListItem(
							key: "Student ID",
							value: model.account.details.studentID
						)
						KeyValueListItem(
							key: "Campus ID",
							value: model.account.details.campusID
						)
						KeyValueListItem(
							key: "GT Level",
							value: model.account.details.level)
						KeyValueListItem(
							key: "MAP Grade Level",
							value: model.account.details.mapGradeLevel.ordinal()
						)
						KeyValueListItem(
							key: "House",
							value: model.account.details.house
						)
					}
				}.listStyle(.insetGrouped)
				VStack {
					Button(action: {
						print("First button is tapped")
					}) {
						Text("Logout")
							.frame(minWidth: 0, maxWidth: .infinity)
							.font(.system(size: 18))
							.padding()
							.foregroundColor(.blue)
							.overlay(
								RoundedRectangle(cornerRadius: 12)
									.stroke(Color.blue, lineWidth: 1)
							)
					}
				}.padding()
			}.background(Color(.systemBackground))
				.navigationTitle("Account")
		}
	}
}

struct Account_Previews: PreviewProvider {
	static let typeSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	]

	static var previews: some View {
		Group {
			ForEach(typeSizes, id: \.self) { size in
				Account()
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			Account()
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
	}
}
