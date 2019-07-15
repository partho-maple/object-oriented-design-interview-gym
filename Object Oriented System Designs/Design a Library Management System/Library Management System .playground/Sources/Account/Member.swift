import Foundation

class Member: Account {
    
    
    var id: String = ""
    
    var password: String = ""
    
    var status: AccountStatus
    
    var person: Person
    
    func resetPassword() -> Bool {
        
    }
    

    private var dateOfMembership: Date?
    private var totalBooksCheckedout: Int?
    
    init() {
        
    }

    public func getTotalBooksCheckedout() -> Int {
        
    }

    public func reserveBookItem(_ bookItem: BookItem) -> Bool {
        
    }

    private func incrementTotalBooksCheckedout() -> () {
        
    }

    public func checkoutBookItem(_ bookItem: BookItem) -> Bool {
        if self.getTotalBooksCheckedout() >= Constants.MAX_BOOKS_ISSUED_TO_A_USER {
            //TODO: ShowError("The user has already checked-out maximum number of books");
            return false
        }
        var bookReservation: BookReservation? = BookReservation.fetchReservationDetails(bookItem.barcode, memberId: self.id)
        if bookReservation?.memberId != self.id {
            // book item has a pending reservation from another user
            //ShowError("This book is reserved by another member");
            return false
        } else if bookReservation != nil {
            // book item has a pending reservation from the give member, update it
            bookReservation?.status = ReservationStatus.completed
        }

        if !bookItem.checkout(self.id) {
            return false
        }

        self.incrementTotalBooksCheckedout();
        return true
    }

    private func checkForFine(_ bookItemBarcode: String) {
        let bookLending = BookLending.fetchLendingDetails(barcode: bookItemBarcode, memberId: self.id)
        let dueDate = bookLending.dueDate
        let today = Date()
        // check if the book has been returned within the due date
        if today.compare(today).rawValue > 0 {
            // calculate the diff days and geet fine
            Fine.collectFine(self.id, days: 120)
        }
    }

    public func returnBookItem(_ bookItem: BookItem) {
        self.checkForFine(bookItem.barcode)
        let bookReservation: BookReservation? = BookReservation.fetchReservationDetails(bookItem.barcode, memberId: self.id)
        if bookReservation != nil {
            // book item has a pending reservation
            bookItem.status = BookStatus.reserved
            // bookReservation.sendBookAvailableNotification();
        }
        bookItem.status = BookStatus.available
    }

    public func renewBookItem(_ bookItem: BookItem) {
        self.checkForFine(bookItem.barcode)
        var bookReservation: BookReservation? = BookReservation.fetchReservationDetails(bookItem.barcode, memberId: self.id)
        // check if this book item has a pending reservation from another member
    }
}
