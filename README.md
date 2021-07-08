**RebrickableSDK** is a framework that uses [Rebrickable APIs](https://rebrickable.com/api/v3/docs/?key=5d31bd9f6fe3ad39cbcc573bd64bada1) to build their own apps that want to use the Rebrickable database.

## Getting Started
### Installation with Carthage
Add the following to your **Cartfile**:

```
github "https://github.com/renTramontano/RebrickableSDK"
```
then:
```
carthage update --platform ios
```

### Installation with Swift Package Manager
Add the following to your **Package.swift**

```swift
dependencies: [
    .package(url: "https://github.com/renTramontano/RebrickableSDK.git", .upToNextMajor(from: "1.0.1"))
]
``` 

### Usage
To use the SDK generate the [API Key](https://rebrickable.com/users/kingborn187/settings/#api)
```swift
let legoApi = LegoAPI(apiKey: "<YOUR_API_KEY>")
```

## License
RebrickableSDK is licensed under the MIT License. See the LICENSE file for more information.
