import Foundation

class ___FILEBASENAME___: Codable {
    
    var id: String
    var name: String
    var filter1: String
    var filter2: String
    
    var latiute: Double
    var longitude: Double
    
    internal init(id: String, name: String, filter1: String, filter2: String, latiute: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.filter1 = filter1
        self.filter2 = filter2
        self.latiute = latiute
        self.longitude = longitude
    }
    
}

extension ___FILEBASENAME___: Hashable {
    
    static func == (lhs: ___FILEBASENAME___, rhs: ___FILEBASENAME___) -> Bool {
        guard lhs.id == rhs.id else { return false }
        guard lhs.name == rhs.name else { return false }
        guard lhs.filter1 == rhs.filter1 else { return false }
        guard lhs.filter2 == rhs.filter2 else { return false }
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}

extension ___FILEBASENAME___: Comparable {
    
    static func < (lhs: ___FILEBASENAME___, rhs: ___FILEBASENAME___) -> Bool {
        return lhs.name < rhs.name
    }
    
}

extension ___FILEBASENAME___: CustomDebugStringConvertible {
    
    var debugDescription: String {
        return "___FILEBASENAME___(id: \(self.id), name: \(self.name))"
    }
    
}

