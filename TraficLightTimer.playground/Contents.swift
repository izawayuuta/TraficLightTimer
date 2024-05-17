import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Alarm {
    var timer: Timer?
    var count: Int = 0
    var limit1: Int = 5
    var limit2: Int = 10
    var limit3: Int = 15
    
    func start() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countup),
            userInfo: nil,
            repeats: true
        )
    }
    @objc func countup() {
        count += 1
        print("\(count)秒経過")
        if limit1 == count {
            //limit1（5秒の時にプリント文を出力）
            print(TraficLight.green.computedProperty)
        } else if limit2 == count {
            //limit2（10秒の時にプリント文を出力）
            print(TraficLight.yellow.computedProperty)
        } else if limit3 == count {
            //limit3（15秒の時にプリント文を出力）
            print(TraficLight.red.computedProperty)
            timer?.invalidate()
        }
    }
}

   let alarm = Alarm()
   alarm.start()

enum TraficLight {
    case green
    case yellow
    case red
    
    var computedProperty: String {
        switch self {
        case .green:
            return "青になりました！"
        case .yellow:
            return "黄になりました！"
        case .red:
            return "赤になりました！"
        }
    }
}

