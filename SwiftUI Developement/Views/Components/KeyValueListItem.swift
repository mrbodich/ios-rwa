import SwiftUI

struct KeyValueListItem: View {
	var key: String;
	var value: String?;
	var truncation: Text.TruncationMode? = .head;

    var body: some View {
		HStack {
			Text(key)
			Spacer(minLength: 32)
			Text(value ?? key)
				.lineLimit(1)
                .redacted(reason: value == nil ? .placeholder : [])
				.truncationMode(truncation!)
		}
    }
}

struct KeyValueListItem_Previews: PreviewProvider {
	static var previews: some View {
        KeyValueListItem(
            key: "House",
            value: "House of Waterloo",
            truncation: .middle
        )
        .exhaustivePreview()
	}
}
