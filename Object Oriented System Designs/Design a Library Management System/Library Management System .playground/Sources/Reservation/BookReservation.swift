import Foundation


struct BookReservation {
    private lazy var creationDate: Date? = nil
    var status: ReservationStatus {
        get {
            return self.status
        }
        set (newStatus) {
            self.status = newStatus
        }
    }
    private let bookItemBarcode: String
    var memberId: String
    
    static func fetchReservationDetails(_ barcode: String, memberId: String) -> BookReservation {
        
    }
}



