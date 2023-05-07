import SwiftUI

struct UserInfoItem: View {
	var account: AccountInfo

	var body: some View {
		HStack(alignment: .center, spacing: 12) {
			Image("Avatar")
				.resizable()
				.frame(width: 46, height: 46, alignment: .center)
			VStack(alignment: .leading) {
				Text(account.fullName)
					.lineLimit(1)
					.truncationMode(.middle)
				Text(account.email)
					.lineLimit(1)
					.truncationMode(.tail)
					.foregroundColor(.blue)
			}
			Spacer()
		}
    }
}

struct UserInfoItem_Previews: PreviewProvider {
	static let account = AccountInfo(
		firstName: "Luke",
		lastName: "Skywalker",
		email: "luke@skywalker.com"
	)

	static var previews: some View {
        UserInfoItem(account: account)
            .exhaustivePreview()
	}
}
