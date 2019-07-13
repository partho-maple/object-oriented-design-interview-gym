import Foundation


class Librarian: Account {
    var id: String
    
    var password: String
    
    var status: AccountStatus
    
    var person: Person
    
    init(_ id: String, password: String, status: AccountStatus, person: Person) {
        self.id = id
        self.password = password
        self.status = status
        self.person = person
    }
    
    func resetPassword() -> Bool {
        
    }
    
    func addBookItem(_ bookItem: BookItem) -> Bool {
        
    }
    
    func blockMember(_ member: Member) -> Bool {
        
    }
    
    func unBlockMember(_ member: Member) -> Bool {
        
    }
}
