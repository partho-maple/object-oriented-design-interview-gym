import Foundation

protocol Book {
    var ISBN: String { get set }
    var title: String { get set }
    var subject: String { get set }
    var publisher: String { get set }
    var language: String { get set }
    var numberOfPages: Int { get set }
    var authors: [Author] { get set }
}




