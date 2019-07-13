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

    public func getTotalBooksCheckedout() -> Int {
        
    }

    public func reserveBookItem(_ bookItem: BookItem) -> Bool {
        
    }

    private func incrementTotalBooksCheckedout() -> () {
        
    }

    public func checkoutBookItem(_ bookItem: BookItem) -> Bool {
        if self.getTotalBooksCheckedout() >= Constants.MAX_BOOKS_ISSUED_TO_A_USER {
            //TODO: ShowError("The user has already checked-out maximum number of books");
            return false;
        }
        var bookReservation: BookReservation? = BookReservation.fetchReservationDetails(bookItem.barcode, memberId: self.id)
        if bookReservation?.memberId != self.id {
            // book item has a pending reservation from another user
            //ShowError("This book is reserved by another member");
            return false;
        } else if bookReservation != nil {
            // book item has a pending reservation from the give member, update it
            bookReservation?.status = ReservationStatus.completed
        }

        if (!bookItem.checkout(this.getId())) {
            return false;
        }

        this.incrementTotalBooksCheckedout();
        return true;
    }

    private func checkForFine(_ bookItemBarcode: String) {
        BookLending bookLending = BookLending.fetchLendingDetails(bookItemBarcode);
        Date dueDate = bookLending.getDueDate();
        Date today = new Date();
        // check if the book has been returned within the due date
        if (today.compareTo(dueDate) > 0) {
            long diff = todayDate.getTime() - dueDate.getTime();
            long diffDays = diff / (24 * 60 * 60 * 1000);
            Fine.collectFine(memberId, diffDays);
        }
    }

    public func returnBookItem(_ bookItem: BookItem) {
        this.checkForFine();
        BookReservation bookReservation = BookReservation.fetchReservationDetails(bookItem.getBarcode());
        if (bookReservation != null) {
            // book item has a pending reservation
            bookItem.updateBookItemStatus(BookStatus.RESERVED);
            bookReservation.sendBookAvailableNotification();
        }
        bookItem.updateBookItemStatus(BookStatus.AVAILABLE);
    }

    public func renewBookItem(_ bookItem: BookItem) {
        this.checkForFine();
        BookReservation bookReservation = BookReservation.fetchReservationDetails(bookItem.getBarcode());
        // check if this book item has a pending reservation from another member
        if (bookReservation != null && bookReservation.getMemberId() != member.getMemberId()) {
            ShowError("This book is reserved by another member");
            member.decrementTotalBooksCheckedout();
            bookItem.updateBookItemState(BookStatus.RESERVED);
            bookReservation.sendBookAvailableNotification();
            return false;
        } else if (bookReservation != null) {
            // book item has a pending reservation from this member
            bookReservation.updateStatus(ReservationStatus.COMPLETED);
        }
        BookLending.lendBook(bookItem.getBarCode(), this.getMemberId());
        bookItem.updateDueDate(LocalDate.now().plusDays(Constants.MAX_LENDING_DAYS));
        return true;
    }
}
