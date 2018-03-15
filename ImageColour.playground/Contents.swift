//: A UIKit based Playground for presenting user interface
  
import UIKit
import Foundation
import PlaygroundSupport

class PlaygroundContainer: UIView {

	let linkButton: PlaygroundButton
	let cameraButton: PlaygroundButton
	let photoButton: PlaygroundButton
	
	init() {
		self.linkButton = PlaygroundButton(imageFile: UIImage(named: "Links.png")!, buttonSize: 60)
		self.cameraButton = PlaygroundButton(imageFile: UIImage(named: "Camera.png")!, buttonSize: 60)
		self.photoButton = PlaygroundButton(imageFile: UIImage(named: "Photos.png")!, buttonSize: 60)
		super.init(frame: CGRect.zero)
		
		linkButton.translatesAutoresizingMaskIntoConstraints = false
		cameraButton.translatesAutoresizingMaskIntoConstraints = false
		photoButton.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(linkButton)
		self.addSubview(cameraButton)
		self.addSubview(photoButton)
		
		self.addConstraints([
		
			// Link Button
			NSLayoutConstraint(item: linkButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: linkButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: linkButton, attribute: .bottom, multiplier: 1.0, constant: 0),
			
			// Camera Button
			NSLayoutConstraint(item: cameraButton, attribute: .leading, relatedBy: .equal, toItem: linkButton, attribute: .trailing, multiplier: 1.0, constant: 40),
			NSLayoutConstraint(item: cameraButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: cameraButton, attribute: .bottom, multiplier: 1.0, constant: 0),
			
			// Photo Button
			NSLayoutConstraint(item: photoButton, attribute: .leading, relatedBy: .equal, toItem: cameraButton, attribute: .trailing, multiplier: 1.0, constant: 40),
			NSLayoutConstraint(item: photoButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: photoButton, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: photoButton, attribute: .bottom, multiplier: 1.0, constant: 0)
		
		])
	
	}
	
	required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

class MyViewController: UIViewController {
	
    override func loadView() {
		
		let buttonContainer = PlaygroundContainer()
		
		self.view.backgroundColor = UIColor.brown
		
		buttonContainer.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(buttonContainer)
		
		self.view.addConstraints([
			NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: buttonContainer, attribute: .bottom, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: buttonContainer, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
		])
		
//		downloadImage(imageLocation: "http://media.idownloadblog.com/wp-content/uploads/2014/08/Yosemite-4-wallpaper-thumbnail.png", completionHandler: { possibleImage in
//			print("Got here1")
//			DispatchQueue.main.async {
//
//				if possibleImage != nil {
//					imageView.image = possibleImage
//				} else {
//					print("Bad image")
//				}
//
//			}
//
//		})
		
		//view.addSubview(imageView)
		
		
    }
	
    func downloadImage(imageLocation: String, completionHandler: @escaping(UIImage?) ->()) {
		print("Got here2")
		if let imageURL = URL(string: imageLocation) {
		print("Got here3")
			URLSession.shared.dataTask(with: URLRequest(url: imageURL, timeoutInterval: 30.0)) { returnData, returnResponse, returnError in
			print("Got here4")
				if returnError == nil {
					if let finalData = returnData, let finalImage = UIImage(data: finalData) {
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

	
}
// Present the view controller in the Live View window
PlaygroundPage.current.needsIndefiniteExecution = false
PlaygroundPage.current.liveView = MyViewController()

class PlaygroundButton: UIView {

	var imageIcon = UIImageView()
	
	init(imageFile: UIImage, buttonSize: Int) {
		super.init(frame: CGRect(x: 50, y: 50, width: buttonSize, height: buttonSize))
		
		imageIcon.image = imageFile
		imageIcon.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(imageIcon)
		self.backgroundColor = UIColor.white
		self.layer.cornerRadius = CGFloat(buttonSize / 2)
		self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOpacity = 0.1
		self.layer.shadowRadius = CGFloat(buttonSize / 2)
		
		self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonPressed)))
		
		self.addConstraints([
			NSLayoutConstraint(item: imageIcon, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: imageIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: imageIcon, attribute: .trailing, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: imageIcon, attribute: .bottom, multiplier: 1.0, constant: 10)
		])
	
	}
	
	required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	@objc func buttonPressed() {
	
		self.backgroundColor = UIColor.red
	
		UIView.animate(withDuration: 0.1, delay: 0.05, animations: {
			self.backgroundColor = UIColor.white
		}, completion: nil)
		
//		UIView.animate(withDuration: 1.0, delay: 2.0, animations: {
//			self.layer.backgroundColor = UIColor.white as! CGColor
//		}, completion: nil)
	
	}

}




