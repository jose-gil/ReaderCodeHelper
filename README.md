# ReaderCodeHelper

[![CI Status](http://img.shields.io/travis/Jose Gil/ReaderCodeHelper.svg?style=flat)](https://travis-ci.org/jose-gil/ReaderCodeHelper)

## What is this 

This is a helper code for educational purposes and only has the basic elements of CocoaPod Library. 

## Installation

'ReaderCodeHelper' is now available through the dependency manager [CocoaPods](http://cocoapods.org). 
You do have to use cocoapods version 0.36. At this moment this can be installed as a pre release by executing:

```
[sudo] gem install cocoapods --pre
```

If you have installed cocoapods version 0.36 or later, then you can just add 'ReaderCodeHelper'  to your workspace by adding the folowing line to your Podfile:

```
pod 'ReaderCodeHelper', :git => 'https://github.com/jose-gil/ReaderCodeHelper.git'
```

Version 0.36 of cocoapods will make a dynamic framework of all the pods that you use. Because of that it's only supported in iOS 8.0 or later. When using a framework, you also have to add an import at the top of your swift file like this:

```
import ReaderCodeHelper
```

Finally, to setup your dependencies  with [CocoaPods](http://cocoapods.org) run the following command:

```
pod install
```


## Author

Jose Gil, jose.gil@tollaga.com

## License

ReaderCodeHelper is available under the MIT license. See the LICENSE file for more info.

