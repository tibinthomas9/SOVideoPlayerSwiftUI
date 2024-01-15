# VideoPlayerSwiftUI 

 A SwiftUI app to play a list of videos referenced from an api loaded from a local nodejs server

## UI 

SwiftUI 

## Architectural pattern

 MVVM 

## Components in focus

 [video player swiftui](https://developer.apple.com/documentation/avkit/videoplayer) , Generic Network Client

## Dependencies 

[swift-markdown-ui](https://github.com/gonzalezreal/swift-markdown-ui) - To parse and display markdown text in description property from api

## Test coverage

 80.9 %

## Tradeoffs

 - Using the default Video Player in SwiftUI, which doesn't support hiding native controls. 
   I could have ported the customizable player from  AVKit but encountered playback issues while trying to implement it.
   
- Although the native SwiftUI text component supports displaying markdown content, 
  it doesn't support parsing all elements of markdown like headings so I had to use a custom third party library to implement it

## No of screens

 1

##  Minimum Deployment target 

iOS 15.0

## Screenshots


* Video List Screen
<img src="SS1.png?raw=true" width="234" height="506" />


