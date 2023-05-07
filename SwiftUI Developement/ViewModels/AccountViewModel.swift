import Combine

final class AccountViewModel: ObservableObject {
	init() { fetch() }

	@Published private(set) var account = AccountInfo()

	private func fetch() {
        APIService().getAccount { [weak self] in
            self?.account = $0
        }
	}
}
