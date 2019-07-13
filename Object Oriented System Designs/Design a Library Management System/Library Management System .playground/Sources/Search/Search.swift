import Foundation


protocol Search {
    func searchByTitle(_ title: String) -> [Book]
    func searchByAuthor(_ author: String) -> [Book]
    func searchBySubject(_ subject: String) -> [Book]
    func searchByPubDate(_ publishDate: Date) -> [Book]
}

