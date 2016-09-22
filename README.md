# jKool Tracking API for iOS

Welcome to the jKool Tracking API for iOS. By importing this pod into your app and adding just a few lines of code to your AppDelegate, your users experience with you app will be automatically streamed to jKool. With a jKool subscription, you can then view data about your user's experience with you app.  If you do not have a jKool account, you can [register](https://www.jkoolcloud.com/signup/signup) free. The jKool User Interface makes viewing your data visual and easy to understand due to it's graphical representations of your data. Also, using jKools Query Language (JKQL), you can use English-like queries to query and analyze your data in a manner that is customized to your liking. This pod will stream user clicks and the screens they visited as 'Events'. It will stream data about the user's entire session with the app as 'Activities'. Please read more about how the data is structured below.

This pod makes use of the jKool Client API for iOS. the jKool Client API Cocoa Pod allows you to stream, query, and subscribe to jKool data. Using this API, you can stream, query, and subscribe to your own custom data. So by importing the Tracking Cocoa Pod, you will also have access to the Client API Cocoa Pod. Please read about the [jKool Client API] (https://github.com/Nastel/jkool-client-objc-api)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

jKool LLC

## License

Please refer to the LICENSE file.

##To get started:

Include this Api by putting the following in your PodFile:
```ruby
pod 'jkool-client-objc-tracking'
```

## Info.plist 
If you wish to know the location of the user's device in each event, please add the following to your app's info.plist under 'Required device capabilities':
```objective-c
location-services
gps
```

## Add to AppDelegate
To get the Tracking working, please add the following to your AppDelegate. Please note that your 'token' you wil get when your register for jKool.

To applicationDidBecomeActive and applicationWillEnterForeground add:
```objective-c
 [jKoolTracking createjKoolActivity];
```

To applicationDidEnterBackground add:
```objective-c
[jKoolTracking streamjKoolActivity];
```

To didFinishLaunchingWithOptions add:
```objective-c
[jKoolTracking initializeTracking:@"your-token"];
```

## Seeing results

There is an Example app in this pod. It contains a complete working app with all of the above mentioned code in it. Simply replace your access token where “your-token” is specified in order to see the app working. We recommend you do the following:

* Run the App. 
* Click all three buttons. 
* Exit the App. Please note that it is important to exit. Your data will not get into your jKool repository until your app is exited or pushed to the background. 
* View the streamed data in jKool by logging into your jKool repository.  Simply do "get events fields all" to see the three clicked events and do "get activites fields all" to see the streamed activity. 

##Support

If you have any questions or concerns, please reach out to us by emailing support@jkoolcloud.com. We will get back to you as quickly as possible.



