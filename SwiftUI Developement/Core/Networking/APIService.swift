import Foundation

struct APIService {
    let baseUrl: URL
    
    init() {
        guard let url = URL(string: "https://ios.rp.devfactory.com") else { fatalError("URL is not correct!") }
        self.baseUrl = url
    }
    
	func getAccount(completion: @escaping (AccountInfo) -> ()) {
		URLSession.shared.dataTask(with: subRoute("accounts")) { data, _, _ in
			let account = try! JSONDecoder().decode(AccountInfo.self, from: data!)
			DispatchQueue.main.async {
				print(account)
				completion(account)
			}
		}.resume()
	}
    
    func getRewards() async throws -> RewardsModel {
        let (data, _) = try await URLSession.shared.data(from: subRoute("rewards"))
        return try transactionDateDecoder.decode(RewardsModel.self, from: data)
    }
    
    func getTransactions() async throws -> [TransactionModel] {
        let (data, _) = try await URLSession.shared.data(from: subRoute("rewards/transactions"))
        return try transactionDateDecoder.decode([TransactionModel].self, from: data)
    }
    
    func getTransaction(withId id: String) async throws -> TransactionModel {
        let (data, _) = try await URLSession.shared.data(from: subRoute("rewards/transactions/\(id)"))
        return try transactionDateDecoder.decode(TransactionModel.self, from: data)
    }
    
    //MARK: - Private hhelpers
    
    private func subRoute(_ subroute: String) -> URL {
        return baseUrl.appendingPathComponent(subroute)
    }
    
    private let transactionDateDecoder: JSONDecoder = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
