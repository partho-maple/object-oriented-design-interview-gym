import Foundation



class BookItem: Book {
    
    // Book protocol
    var ISBN: String
    
    var title: String = ""
    
    var subject: String = ""
    
    var publisher: String = ""
    
    var language: String = ""
    
    var numberOfPages: Int = 0
    
    var authors: [Author] = []
    
    private(set) var barcode: String
    private(set) var isReferenceOnly: Bool = false
    private(set) var borrowed: Date?
    private(set) var dueDate: Date?
    private(set) var price: Double?
    private(set) var format: BookFormat?
    var status: BookStatus = BookStatus.none {
        willSet(newTotalSteps) {
            // Do nothing
        }
        didSet {
            if self.status == BookStatus.loaned  {
                // Notify others
            }
        }
    }
    private(set) var dateOfPurchase: Date?
    private(set) var publicationDate: Date?
    private(set) var placedAt: Rack?
    
    init(barcode: String, ISBN: String) {
        self.barcode = barcode
        self.ISBN = ISBN
    }
    
    func checkout(_ memberId: String) -> Bool {
        if self.isReferenceOnly {
            // ShowError("This book is Reference only and can't be issued");
            return false;
        }
        if !BookLending.lendBook(barcode: self.barcode, memberId: memberId) {
            return false;
        }
        self.status = BookStatus.loaned
        return true;
    }
}
