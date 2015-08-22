## Simple plugin to handle save image to user library on iOS

Fork from  https://github.com/mrPalm/saveToPhotolibrary

## 1 step install

```
cordova plugin add cordova-ios-photo-library
```

## Usage

You **do not** need to reference any JavaScript, the Cordova plugin architecture will add a socialmessage object to your root automatically when you build.

Ensure you use the plugin after your deviceready event has been fired.

### Save image from URL or path (path is relative to the application root)

```
window.ImageHelper.saveToUserLibrary(imageUrl, successCallback, failCallback);
```

## License

[MIT License](http://ilee.mit-license.org)
