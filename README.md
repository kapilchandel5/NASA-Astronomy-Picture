# NASA-Astronomy-Picture
iOS Native APP to see daily published NASA Picture with caching implemented, if the internet is not avilable it shows last day cached image and if the details alreday cached it will show detail from the cache.

MVVM | Caching | Native iOS NASA-Astronomy-Picture

* ##### Note - Image fetched using NASA Open API as mentioned in (https://api.nasa.gov/) portal.

## Table of contents
* [Technologies](#technologies)
* [Modules](#modules)
* [Setup](#setup)
* [Improvement scope](#improvement)


## Technologies
* IDE Xcode: 13.1
* Language: Swift: 5
* Storage: NSCache & Document Directory
* Minimum iOS version supported : 13
* Orientation supported: potrait and upside orientation


## Modules
* NASA-ASTRONOMY App 
* Core ()

## Setup
* Checkout code in your local machine.
* Open NASA-ASTRONOMY.xcodeproj
* Run NASA-ASTRONOMY taget for main application
* Run NASA-ASTRONOMYTests taget for testcases
* Run NASA-ASTRONOMYUTests for UI test cases


## Improvement scope
* Needs to setup dependency Injection
* Image donwloading caching should be in NetworkService Module
* For UI needs to create Design Materail module
* Code refactoring required at some places.
* Test cases needs more covrage.





