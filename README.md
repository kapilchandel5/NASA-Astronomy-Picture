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
* Core
  - NasaPictureDetailUseCase : This class calls network class and if network is not available return result from cached
  - NasaPictureNetwork : This class is responsible for fetching API response and parsing
  - NasaPictureDetail : Data model 
  - DateUtils : contains method to provide date as string in specific format
  - CacheManager : responsible for caching data in document directory
  - UIImageView+Download : extension responsible for downloading image and caching it using cache manager class
  - Constants : It contains constants of the app
  - NasaPictureViewController : View controller 
  - NasaPictureViewModel : View Model  

## Setup
* Checkout code in your local machine.
* Open NASA-ASTRONOMY.xcodeproj
* Run NASA-ASTRONOMY taget for main application
* Run NASA-ASTRONOMYTests taget for testcases
* Run NASA-ASTRONOMYUTests for UI test cases


## Improvement scope
* Needs to setup dependency Injection currently depedency is initilizing with in classes so code can become losely coupled
* Core can be created as sperate module
* For UI needs to create Design module
* Code refactoring required at some places.
* Need to write test cases





