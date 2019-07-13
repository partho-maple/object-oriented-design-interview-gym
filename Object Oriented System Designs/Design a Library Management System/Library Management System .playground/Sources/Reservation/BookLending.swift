import Foundation


class BookLending {
    private var creationDate: Date?
    private var dueDate: Date?
    private var returnDate: Date?
    private var bookItemBarcode: String
    private var memberId: String
    
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
    
    
    static func lendBook(barcode: String, memberId: String) -> Bool { }
    static func  fetchLendingDetails(barcode: String) -> BookLending { }
}

