extension String {
    
    mutating func deleteFirst(numberOfCharacters: Int) {
        let range = self.startIndex..<startIndex.advancedBy(numberOfCharacters)
        self.removeRange(range)
    }
}