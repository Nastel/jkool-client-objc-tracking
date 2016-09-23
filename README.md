# jKool Tracking API for iOS

Welcome to the jKool Tracking API for iOS. By importing this pod into your app and adding just a few lines of code to your AppDelegate, your user's experience with your app will be automatically streamed to your jKool repository. With a jKool subscription, you can then view this data about your user's experience with your app.  If you do not have a jKool account, you can [register](https://www.jkoolcloud.com/signup/signup) free. The jKool User Interface makes viewing your data visual and easy to understand due to it's graphical representations of your data. Also, using [JKQL Query Language](http://www.jkoolcloud.com/download/jKQL%20User%20Guide.pdf), you can use English-like queries to query and analyze your data in a manner that is customized to your liking. This pod will stream user clicks and the screens they visited as 'Events'. It will stream data about the user's entire session with the app as 'Activities'. Please read more about how the data is structured below.

This pod makes use of the jKool Client API for iOS. The jKool Client API allows you to stream, query, and subscribe to jKool data. Using this API, you can stream your own custom data, query your own custom data, and subscribe to your own custom data. So by importing the Tracking Cocoa Pod, you will also have access to the Client API Cocoa Pod. Please read about the [jKool Client API] (https://github.com/Nastel/jkool-client-objc-api).

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
If you wish to know the location of the user's device in each event, add the following to your app's info.plist under 'Required device capabilities':
```objective-c
location-services
gps
```

## Add to AppDelegate
To get the Tracking working, add the following to your AppDelegate. Please note that 'your-token' you will obtain when your register for jKool.

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

There is an Example app in this pod. It contains a complete working app with all of the above mentioned code in it. Simply replace “your-token” with the token that was assigned to you when you registered for jKool. To get a feel for this Tracking API, we recommend you do the following:

* Run the App. 
* Click all three buttons. 
* Exit the App. Please note that it is important to exit. Your data will not get into your jKool repository until your app is exited or pushed to the background. 
* View the streamed data in jKool by logging into your jKool repository.  Simply do "get events fields all" to see the three clicked events and do "get activites fields all" to see the streamed activity. 

## Understanding Results
The following lists the Event and Activity fields and the data that is stored in them. We are only listing fields that should be of interest for you regarding Tracking. Additional fields you may notice, may be of interest to you if you are streaming your own custom data. Please see the [jKool Client API] (https://github.com/Nastel/jkool-client-objc-api) and the [jKool Model Guide](https://www.jkoolcloud.com/download/jkool-model.pdf) for more information on these additional fields and on how to stream your own custom data.

Event Fields:
* EventId - A unique identifier for the streamed event.
* ParentId - The unique identifier of the activity associated with the event.
* EventName - The name of the event. This will be the name of the Action that was trigger concatenated with the name of the ViewContoller that the action occurred on.
* StartTime - The time the action occurred.
* Tag - The name of the ViewController that the action occurred on.
* Properties - Properties on the Event contain specifics about the location that the event occurred at. It will contain: the city name, country, state, timezone, latitude and longitude.
* GeoLocaton - The GPS coordinates of the location that the event occurred at.

Activity fields:
* Properties - Descriptive location information (like event properties) as well as information about the device such as: free memory, iOS version, phone carrier, etc.
* GeoLocaton - The GPS coordinates of the location that the event occurred at.
* EventId - A list of events that occurred during the activity.
* StartTime - The time the activity started. This will either be the time the app was launched or the time came it to the foreground.
* EndTime - The time the activity ended. This will be the time the app got sent to background.

## Special note about properties
In normal streaming to jKool via the jKool Client API, custom user fields are stored in jKool 'properties'. This tracking API is making use of 'properties' to store descriptive location information and to store information about the user's device. Please refer to the [JKQL Query Language](http://www.jkoolcloud.com/download/jKQL%20User%20Guide.pdf) to see how to query properties as they require special syntax.

##Support

If you have any questions or concerns, please reach out to us by emailing support@jkoolcloud.com. We will get back to you as quickly as possible.



