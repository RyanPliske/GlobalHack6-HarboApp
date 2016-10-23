import UIKit
import RSBarcodes

struct BarcodeInformation {
    var firstName: String
    var lastName: String
    var middleName: String
    var streetAddress: String
    var city: String
    var state: String
    var country: String
}

class BarCodeScannerViewController: RSCodeReaderViewController {
    
    var haveScanned: Bool = false
    var barcodeInfo: BarcodeInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.focusMarkLayer.strokeColor = UIColor(red: 182/255, green: 209/255, blue: 110/255, alpha: 1.0).CGColor
        
        self.cornersLayer.strokeColor = UIColor(red: 182/255, green: 209/255, blue: 110/255, alpha: 1.0).CGColor
        
        self.tapHandler = { point in
//            print(point)
        }
        
        self.barcodesHandler = { barcodes in
            if !self.haveScanned {
                for barcode in barcodes {
                    self.haveScanned = true
//                    self.barcodeInfo =
                        self.parseBarcode(barcode.stringValue)
                }
            }
        }
    }
    
    func parseBarcode(barcode: String) { //-> BarcodeInformation {
        var sentenceLines:[String] = []
        barcode.enumerateLines {
            var barcodeInfo = $0.line
            if barcodeInfo.characters.count > 2 {
                barcodeInfo.deleteFirst(3)
                sentenceLines.append(barcodeInfo)
            }
        }
        
        let bcInfo = BarcodeInformation(firstName: sentenceLines[3], lastName: sentenceLines[1], middleName: sentenceLines[5], streetAddress: sentenceLines[16], city: sentenceLines[17], state: sentenceLines[18], country: sentenceLines[21])
        
        let parentVC = parentViewController as! UITabBarController
        
        dispatch_async(dispatch_get_main_queue()) {
            Session.mainInstance.model.setLastName(bcInfo.lastName)
            Session.mainInstance.model.setFirstName(bcInfo.firstName)
            Session.mainInstance.model.setMiddleName(bcInfo.middleName)
            
            parentVC.selectedIndex = 2

        }
//        return bcInfo
    }
     
//    ANSI 636030050102DL00410270ZM03110056DLDAQW147152007
//    DCSCUNNINGHAM
//    DDEN
//    DACIAN
//    DDFN
//    DADPATRICK
//    DDGN
//    DCAF
//    DCBA
//    DCDNONE
//    DBD05072014
//    DBB04081996
//    DBA04082018
//    DBC1
//    DAU072 in
//    DAYBLU
//    DAG1250 CARMAN RD
//    DAIMANCHESTER
//    DAJMO
//    DAK630210000
//    DCF141471270039
//    DCGUSA
//    DAW145
//    DCK14128W1471520070201
//    DDB12102012
//    DDJ04082017
//    
//    ZMZMAY
//    ZMBN
//    ZMCN
//    ZMDN
//    ZMEN
//    ZMFSTLO
//    ZMG0
//    ZMH0
//    ZMI0
//    ZMJ0
//    
//    ANSI 636030050102DL00410267ZM03080055DLDAQU147116010
//    DCSBRENNAN
//    DDEN
//    DACKATHERINE
//    DDFN
//    DADPAULINE
//    DDGN
//    DCAF
//    DCBA
//    DCDNONE
//    DBD03222016
//    DBB03301993
//    DBA03302017
//    DBC2
//    DAU066 in
//    DAYHAZ
//    DAG11515 CRAIG CT APT 411
//    DAIST LOUIS
//    DAJMO
//    DAK631460000
//    DCF161180820024
//    DCGUSA
//    DAW110
//    DCK16083U1471160100101
//    DDB12102012
//    
//    ZMZMAY
//    ZMBN
//    ZMCN
//    ZMD
//    ZMEN
//    ZMFSTLC
//    ZMG0
//    ZMH0
//    ZMI0
//    ZMJ0
}
