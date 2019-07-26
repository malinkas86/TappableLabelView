# TappableLabelView
![CI Status](https://img.shields.io/badge/build-passing-brightgreen)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org/)
[![Version](https://img.shields.io/badge/version-1.0.0-blue)](http://cocoapods.org/pods/TappableLabelView)
[![License](https://img.shields.io/badge/license-MIT-red)](http://cocoapods.org/pods/TappableLabelView)

**TappableLabelView** is a component that helps you to have s string as long as you desire, with specific strings that could be tapped. It gives you the flexibility to customize attributes such as *text alignment*, *text styling* etc.

|Standard Text Version|Underlined Text Version|
|--|--|
| ![Standard Text Version](https://media.giphy.com/media/lSnZHsN1dZM00HSHV9/giphy.gif) | ![Underlined Text Version](https://giphy.com/gifs/l3aAYFfDOTjPc2OVST/html5) |

# New Features!

- [x] A lengthy string as long as you desire.
- [x] Customizable text styling.
- [x] Customizable highlighted text styling.
- [x] Customizable text alignment.
- [x] Handling scenarios with multiple occurrences of the exact same string.
- [x] Multiple **TappableLabelView**s in a single file can be handled separately.

## Requirements

 - iOS 10.0+
 - Xcode 10.2+

### Installation

### CocoaPods

TappableLabelView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TappableLabelView'
```

Install the dependencies.

```sh
$ pod install
```

Then add the following at the top of each file you use TappableLabelView in your project.
```swift
import TappableLabelView
```

## How to use

 1. Add an **UIView** to your view programmatically or into a nib file.
 2. Make its type **TappableLabelView**.
 3. Provide configuration options.
	 - textAttributes - Text styling for regular text.
	 - highlightedTextAttributes - Text styling for highlighted text (Tappable text).
	 - alignment - Text alignment (`.left, .right, .justified`)
	 -  isUnderline - Specify if the tappable text should be underlined.
	 - wordSpacing - Spacing between the words.
	 - lineSpacing - Spacing between the text lines.
 4. Provide the *text* to be displayed.
 5. Provide the list of tappable strings as an array. - Please make sure that all the punctuations related to a particular word, should also be included as part of the tappable string.
 
## Implementing programmatically

 - Declare element.
	`var tappableLabelView: TappableLabelView!`
 - In `viewDidLoad()`
 ```swift
 override func viewDidLoad() {
        super.viewDidLoad()
        let options = ConfigurationOptions(textAttributes: textStyle.attributes,
                                           highlightedTextAttributes: highlightedTextStyle.attributes,
                                           alignment: .left,
                                           isUnderline: true,
                                           wordSpacing: 5,
                                           lineSpacing: 6,
                                           delegate: self)
        tappableLabelView = TappableLabelView(frame: .zero, options: options)
        tappableLabelView.translatesAutoresizingMaskIntoConstraints = false
        tappableLabelView.text = "Tappable text"
        tappableLabelView.tappableStrings = ["text", "Tappable"]
        view.addSubview(tappableLabelView)
        NSLayoutConstraint.activate([
                tappableLabelView.heightAnchor.constraint(equalToConstant: 200),
                tappableLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tappableLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tappableLabelView.topAnchor.constraint(equalTo: view.topAnchor)
            ])
    }
 ```
 
 ## Implementing using a nib file
 - Add a **UIView** to the nib file and make its type `TappableLabelView`.
 - Create an `IBOutlet` for the tappableLabelView
 - Set options explicitly in `viewDidLoad()`.
```swift        
tappableLabelView.options =  ConfigurationOptions(textAttributes: textStyle.attributes,
                                           highlightedTextAttributes: highlightedTextStyle.attributes,
                                           alignment: .left,
                                           isUnderline: true,
                                           wordSpacing: 5,
                                           lineSpacing: 6,
                                           delegate: self)
tappableLabelView.text = "Tappable text"
tappableLabelView.tappableStrings = ["text", "Tappable"]
```


## Handling tap events
Conform the class to `TappableLabelViewDelegate` and implement `didTap` function where events can be handled as shown below..
### Parameters
- tappableLabelView - Relevent `tappableLabelView` which was tapped (in scenarios where multiple tappable label views are used in a single view).
- text - Tapped text.
- indexInText - Index of the tapped string, in the provided whole lengthy text.
- index - Index of the tapped string, in the provided list of tappable strings
```swift
func didTap(tappableLabelView: TappableLabelView, text: String, indexInText: Int, index: Int) {
        if self.tappableLabelView == tappableLabelView {
            // Handle event
        }
    }
```

## Example project
Download the sample project [here](https://github.com/malinkas86/TappableLabelViewExample).

