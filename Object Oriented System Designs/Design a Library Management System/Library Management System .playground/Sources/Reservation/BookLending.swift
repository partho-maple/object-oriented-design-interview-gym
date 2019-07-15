import Foundation


class BookLending {
    private(set) var creationDate: Date?
    private(set) var dueDate: Date?
    private(set) var returnDate: Date?
    private(set) var bookItemBarcode: String
    private(set) var memberId: String
    
    // Designated Initializer
    init(bookItemBarcode: String, memberId: String) {
        self.memberId = memberId
        self.bookItemBarcode = bookItemBarcode
    }
    
    // Convenience Initializer
    convenience init(creationDate: Date, dueDate: Date, returnDate: Date, bookItemBarcode: String, memberId: String) {
        self.init(bookItemBarcode: bookItemBarcode, memberId: memberId)
        self.creationDate = creationDate
        self.dueDate = dueDate
        self.returnDate = returnDate
    }
    
    
    static func lendBook(barcode: String, memberId: String) -> Bool {
        return false
    }
    static func  fetchLendingDetails(barcode: String, memberId: String) -> BookLending {
        return BookLending(bookItemBarcode: barcode, memberId: memberId)
    }
}

