import Foundation

class SeekerData {
    var firstName: String!
    var middleName: String!
    var lastName: String!
    var ssn: String!
    var dateOfBirth: String!
}


class AddUserModel {
    
    let seekerData = SeekerData()
    
    func setFirstName(firstName: String) {
        seekerData.firstName = firstName
    }
    
    func setMiddleName(middleName: String) {
        seekerData.middleName = middleName
    }
    
    func setLastName(lastName: String) {
        seekerData.lastName = lastName
    }
    
    func setSSN(ssn: String) {
        seekerData.ssn = ssn
    }
    
    func setDateOfBirth(dateOfBirth: String) {
        seekerData.dateOfBirth = dateOfBirth
    }
    
    
    func finalizeAndSend() {
        // Tell UserSession To Send SeekerData userSession.saveData(seekerData:SeekerData)
    }
    
}