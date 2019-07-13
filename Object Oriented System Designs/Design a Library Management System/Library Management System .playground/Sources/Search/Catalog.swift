import Foundation



class Catalog: Search {
    
    private lazy var bookTitles: Dictionary<String, [Book]>? = nil
    private lazy var bookAuthors: Dictionary<String, [Book]>? = nil
    private lazy var bookSubjects: Dictionary<String, [Book]>? = nil
    private lazy var bookPublicationDates: Dictionary<String, [Book]>? = nil
    
    func searchByTitle(_ title: String) -> [Book] {
        
    }
    
    func searchByAuthor(_ author: String) -> [Book] {
        
    }
    
    func searchBySubject(_ subject: String) -> [Book] {
        
    }
    
    func searchByPubDate(_ publishDate: Date) -> [Book] {
        
    }
}
