import UIKit


extension URL {
    func allLines() async -> Lines {
       return Lines(url: self)
    }
}

struct Lines: Sequence {
    let url: URL
    
    func makeIterator() -> some IteratorProtocol {
        let line = (try? String(contentsOf: url))?.split(separator: "\n") ?? []
        return LineIterator(lines: line)
    }
}

struct LineIterator : IteratorProtocol {
   
    typealias Element = String
    
    var lines: [String.SubSequence]
    
    mutating func next() -> Element? {
        if lines.isEmpty {
            return nil
        }
        return String(lines.removeFirst())
    }
}

let endPointURL = URL(string: "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv")

/*
Task {
    for line in await endPointURL!.allLines() {
        print(line)
    }
}
*/

Task {
    for try await line in endPointURL!.lines {
        print(line)
    }
    
}
