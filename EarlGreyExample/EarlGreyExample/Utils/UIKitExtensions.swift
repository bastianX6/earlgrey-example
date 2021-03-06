import UIKit

@objc protocol ReusableIdentifierProtocol {
    static var reusableIdentifier: String { get }
}

@objc protocol NibProtocol {
    static var nib: UINib { get }
}

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: ReusableIdentifierProtocol {
    static var reusableIdentifier: String {
        return nameOfClass
    }
}

extension UIView: NibProtocol {
    static var nib: UINib {
        return UINib(nibName: nameOfClass, bundle: Bundle.main)
    }
}
