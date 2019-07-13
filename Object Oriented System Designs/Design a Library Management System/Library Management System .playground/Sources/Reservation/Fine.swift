import Foundation


class Fine {
    private var creationDate: Date
    private var bookItemBarcode: Double
    private var memberId: String
    
    init(memberId: String, bookItemBarcode: Double, creationDate: Date) {
        self.memberId = memberId
        self.bookItemBarcode = bookItemBarcode
        self.creationDate = creationDate
    }
    
    static func collectFine(_ memberId: String, days: Int64) {
        
    }
}
