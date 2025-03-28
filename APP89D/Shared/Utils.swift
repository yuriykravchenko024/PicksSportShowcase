import Foundation

public func print(_ objects: Any...) {
#if DEBUG
    let joinedObjects = objects
        .map { String(describing: $0) }
        .joined(separator: ", ")
    
    Swift.print(joinedObjects)
#endif
}

public func print(_ object: Any) {
#if DEBUG
    Swift.print(object)
#endif
}
