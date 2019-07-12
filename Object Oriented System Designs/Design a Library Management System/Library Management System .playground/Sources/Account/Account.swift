import Foundation

protocol Account {
    var id: String { get set }
    var password: String { get set }
    var status: AccountStatus { get set }
    var person: Person { get set }
    
    func resetPassword() -> Bool
}
