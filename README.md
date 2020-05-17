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

## Contribution

- Welcome everyone to contribute, review and point out my bad. 

## Licence

```
Copyright 2020 Rover Dream.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```