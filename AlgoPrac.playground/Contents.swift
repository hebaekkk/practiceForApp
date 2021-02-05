import Foundation
import UIKit

func travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived")
}

travel() {
    print("MIDDLE")
}

let handleBlock: (Bool) -> Void = { doneWork in
    if doneWork {
        print("퇴근하세요")
    }
}

let handleBlock1: (Bool) -> Void = {
    if $0 {
        print("출근하세요")
    }
}
