/*:
  	### So whats next?

  	The next few sections of this playground book need an image to work with.

  	*callout(Run the playground)
  	If you're on an iPad, you'll need to run the playground before you can see anything.

  */
//#-hidden-code

//#-end-hidden-code

import UIKit
import PlaygroundSupport

var testing: String?

testing = /*#-editable-code*/<#T##I have a large penis##String?#>/*#-end-editable-code*/

print(testing)

func downloadImage(imageLocation: String, completionHandler: @escaping(UIImage?) ->()) {
	
	print("Download Start")

	if let imageURL = URL(string: imageLocation) {
	
		URLSession.shared.dataTask(with: URLRequest(url: imageURL, timeoutInterval: 30.0)) { returnData, returnResponse, returnError in
	
			if returnError == nil {
				if let finalData = returnData, let finalImage = UIImage(data: finalData) {
					print("Download Finish")
					completionHandler(finalImage)
				}
			} else {
				completionHandler(nil)
			}

		}.resume()

	} else {
		completionHandler(nil)
	}

}
//
//PlaygroundPage.current.needsIndefiniteExecution = true
//PlaygroundPage.current.liveView = pageTwoView

//#-end-hidden-code

//#-editable-code

//#-end-editable-code

//#-hidden-code

//#-end-hidden-code


