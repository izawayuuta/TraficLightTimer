import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Alarm {
    var timer: Timer?
    var count: Int = 0
    var limit1: Int = 3
    var limit2: Int = 6
    var limit3: Int = 9
    var totalCycles: Int = 0
    let limitCycles: Int = 2 // 2回サイクル
        
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
        // 出力のサイクルが指定した数になったら停止
        guard totalCycles < limitCycles else {
            timer?.invalidate()
            return
        }
        
        count += 1
        print("\(count)")
        
        if limit1 == count {
            //limit1（3秒の時にプリント文を出力）
            print(TraficLight.straightGreen.computedProperty)
        } else if limit2 == count {
            //limit2（6秒の時にプリント文を出力）
            print(TraficLight.yellow.computedProperty)
        } else if limit3 == count {
            //limit3（9秒の時にプリント文を出力）
            print(TraficLight.red.computedProperty)
            // 赤と同時に右折の青を出力
            print(TraficLight.turnRightGreen.computedProperty)
            count = 0
            totalCycles += 1 // 1回目のサイクルが終わったら+1
        }
    }
}

   let alarm = Alarm()
   alarm.start()

enum TraficLight {
    case straightGreen // 直進用青信号
    case turnRightGreen // 右折用青信号
    case yellow // 黄
    case red // 赤
    
    var computedProperty: String {
        switch self {
        case .straightGreen:
            return "青"
        case .yellow:
            return "黄"
        case .red:
            return "赤"
        case .turnRightGreen:
            return "右折専用が青"
        }
    }
}

