//#-hidden-code

import UIKit
import PlaygroundSupport

func getImage(file: UIImage) {
	print("gotImage")
}

func downloadImage(imageLocation: String) {
	
	print("Download Start")

	if let imageURL = URL(string: imageLocation) {
	
		URLSession.shared.dataTask(with: URLRequest(url: imageURL, timeoutInterval: 30.0)) { returnData, returnResponse, returnError in
	
			if returnError == nil {
				if let finalData = returnData, let finalImage = UIImage(data: finalData) {
					print("Download Finish")
					//completionHandler(finalImage)
				}
			} else {
				//completionHandler(nil)
			}

		}.resume()

	} else {
		//completionHandler(nil)
	}

}

//#-end-hidden-code
/*:
 ### So what's next?

 We're going to have a look at how images store and use colour but before we can get started on that, you're going to need to get an image for us to work with. You've got two options for how you want to do that.

 * callout(Option 1):
 You can use the `getImage` function below to either pick an image from your camera roll or take a photo using your iPad's camera. Just click on the ImageFile placeholder. There are also several images bundled with this playground that you can use.
 */
/*#-editable-code*/getImage(file: <#T##ImageFile##UIImage#>)/*#-end-editable-code*/

/*:
 * callout(Option 2):
 If you don't want to use your camera or a local image file, this playground has code included to let you download an image from the internet instead. To do this, you'll first need to completely the `getImage` function above the `downloadImage` function

 Once you've run the playground you should see three lights. They represent one pixel in your screen.

 Below that is a yellowish square. This is where the three lights will output the colour they combine to make.

 Alright! Let's get coding. If you look below you should see three functions: `updateRed`, `updateGreen`, and `updateBlue`. Each of these functions will change the brightness of the corresponding light. If you want to turn a light off, set the number to `0.0`. If you want a light to be as bright as possible, set it to `1.0`.


 * callout(Accepted values):
 Technically, the update functions will accept any number as input but for our purposes anything greater than `1.0` will be rounded back down to `1.0` and the inverse goes for `0.0`. Safety first y'all!

*/


//
//PlaygroundPage.current.needsIndefiniteExecution = true
//PlaygroundPage.current.liveView = pageTwoView

//#-end-hidden-code

//#-editable-code

//#-end-editable-code

//#-hidden-code

//#-end-hidden-code
