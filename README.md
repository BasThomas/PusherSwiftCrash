# PusherSwiftCrash

This example project crashes the `PusherSwift` pod.

Steps to reproduce:

- Create a new iOS app (single view)
- `pod init`
- Add the pod to your podfile
- `pod install`
- Put the following code in the `viewDidLoad`:

```swift
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let pusher = Pusher(key: "", options: PusherClientOptions(host: .cluster("")))
    let channel = pusher.subscribe("session-status-1")
    
    let _ = channel.bind(eventName: "App\\Events\\SessionStatusUpdated") {
      guard let data = $0 as? [String: Any], let message = data["message"] as? String else { return }
      print(message)
    }
    
    pusher.connect()
  }
```

- The app now crashes
