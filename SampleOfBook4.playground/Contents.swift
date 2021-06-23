import Foundation

// 送り手
class Poster {
    static let notificationName = Notification.Name("SomeNotification")
    
    func post() {
        print("送信")
        NotificationCenter.default.post(name: Poster.notificationName, object: nil)
        
    }
}

// 受け手
class Observer {
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: Poster.notificationName, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("解除")
    }
    
    @objc func handleNotification(_ notification: Notification) {
        print("通知を受け取りました")
    }
    
}

var observer = Observer()
var poster = Poster()
poster.post()
