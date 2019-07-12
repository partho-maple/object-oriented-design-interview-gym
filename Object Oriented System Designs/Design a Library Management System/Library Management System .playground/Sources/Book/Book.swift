import Foundation

protocol Book {
    var ISBN: String
    var title: String
    var subject: String
    var publisher: String
    var language: String
    var numberOfPages: Int
    var authors: [Author]
}




