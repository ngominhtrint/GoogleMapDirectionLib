# GoogleMapDirectionLib
Wrapped the direction api of Google Map for easier to use.

### Reference

By inspiration on this Android repo [GoogleDirectionLibrary](https://github.com/akexorcist/GoogleDirectionLibrary). I try to wrap Google Map Direction Api for iOS.

### Install

```
pod 'GoogleMapDirectionLib'
```

### Use

```
class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    GoogleDirection.withServerKey(apiKey: GOOGLE_MAP_API_KEY)
      .from(origin: CLLocationCoordinate2D(latitude: 37.7681994, longitude: -122.444538))
      .to(destination: CLLocationCoordinate2D(latitude: 37.7749003, longitude: -122.4034934))
      .avoid(avoid: AvoidType.FERRIES)
      .avoid(avoid: AvoidType.HIGHWAYS)
      .transportMode(transportMode: TransportMode.DRIVING)
      .execute(callback: self)
  }
}

extension ViewController: DirectionCallback {
  
  func onDirectionSuccess(direction: Direction) {
    if(direction.isOK()) {
      // Draw polyline
    } else {
      // Do something
    }
  }
  
  func onDirectionFailure(error: Error) {
    // Do something
  }
}
```
