# FlickrApp
Polarr assessment application.

# Architecture
## MVVM + Separated Domain and Networking platforms
> DomainPlatform as separated target -> visible for Main target

> NetworkPlatform as separated targer -> visible for Domain target

# Used Pods
| Pod | Website | Used for |
| ------ | ------ | ------ |
| Swinject | [https://github.com/Swinject/Swinject] | DI |
| RxSwift + RxCocoa | [https://github.com/ReactiveX/RxSwift] | Core + Bindings |
| Alamofire | [https://github.com/Alamofire/Alamofire] | Networking |
| RxAlamofire | [https://github.com/RxSwiftCommunity/RxAlamofire] | Networking |
| Kingfisher | [https://github.com/onevcat/Kingfisher]| Images fetching and processing |

# Implemented features
## MainViewController with:
* UITextField as a search text field to make able to search for images by given search phrase,
* UICollectionView responsible for displaying fetched images,
* UISwitch responsible for turning on an off blur effect for fetched images.

## FlickrAPI connection:
* Connection with FlickrAPI using method `flickr.photos.search` to get images by given search phrase.

## Images processing:
* There is a possibility to turn the blur effect on for fetched images (by toggling UISwitch control on MainViewController). For images processing `Kingfisher` library is being used (`https://github.com/onevcat/Kingfisher#a-more-advanced-example`).

