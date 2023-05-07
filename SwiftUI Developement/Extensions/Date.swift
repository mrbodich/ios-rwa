import Foundation

extension Date {
	func format() -> String {
		return self.formatted(date: .abbreviated, time: .omitted)
	}
    
    init?(_ dateString: String, format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        self = date
    }
}
