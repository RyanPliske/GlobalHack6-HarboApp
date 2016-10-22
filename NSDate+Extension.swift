import Foundation
extension NSDate {
    
    func returnDateAsString() -> String {
        let unitFlags: NSCalendarUnit = [.Month, .Day, .Year]
        let components = NSCalendar.currentCalendar().components(unitFlags, fromDate: self)
        
        let dateString = "\(components.month)/\(components.day)/\(components.year)"
        return dateString
    }
}
