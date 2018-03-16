//: A UIKit based Playground for presenting user interface
  
import UIKit
import AVFoundation
import PlaygroundSupport

class ActionButton: UIView {

	let actionIcon = UIImageView()

	init() {
		super.init(frame: CGRect.zero)
		
		actionIcon.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(actionIcon)
		
		self.backgroundColor = UIColor.white
		//self.layer.cornerRadius = CGFloat(50)
		self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOpacity = 0.1
		self.layer.shadowRadius = CGFloat(100)
		
		self.addConstraints([
			NSLayoutConstraint(item: actionIcon, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: actionIcon, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: actionIcon, attribute: .trailing, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: actionIcon, attribute: .bottom, multiplier: 1.0, constant: 10)
		])
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

class ActionBar: UIView {

	let linkButton = ActionButton()
	let cameraButton = ActionButton()
	let photoButton = ActionButton()
	let buttonSize = CGFloat(60)

	init() {
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
			NSLayoutConstraint(item: linkButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize),
			NSLayoutConstraint(item: linkButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize),

			// Camera Button
			NSLayoutConstraint(item: cameraButton, attribute: .leading, relatedBy: .equal, toItem: linkButton, attribute: .trailing, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: cameraButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: cameraButton, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: cameraButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize),
			NSLayoutConstraint(item: cameraButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize),

			// Photo Button
			NSLayoutConstraint(item: photoButton, attribute: .leading, relatedBy: .equal, toItem: cameraButton, attribute: .trailing, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: photoButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: photoButton, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: photoButton, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: photoButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize),
			NSLayoutConstraint(item: photoButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize)

		])
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

class InfoBar: UIView {

	let infoLabel = UILabel()

	init() {
		super.init(frame: CGRect.zero)
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

struct ColourSample {
	
	var redSample: CGFloat
	var greenSample: CGFloat
	var blueSample: CGFloat
	var colourValue: UIColor
	
	init(redSample: CGFloat, greenSample: CGFloat, blueSample: CGFloat) {
	
		self.redSample = redSample
		self.blueSample = blueSample
		self.greenSample = greenSample
		
		self.colourValue = UIColor(red: redSample, green: greenSample, blue: blueSample, alpha: 1.0)

	}

}

class ColourGraphOne: UIView {

	let GraphTitle = UILabel()
	let SwatchContainer = UIView()
	
	init() {
		super.init(frame: CGRect.zero)
	
		self.backgroundColor = UIColor.white
		
		GraphTitle.text = "1: Random Swatches"
		GraphTitle.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
		GraphTitle.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: <#T##CGFloat#>)
		
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func createSwatches(colourData: [ColourSample]) {
	
		print("Create Swatches")
	
		let swatchSize = self.frame.width / CGFloat(colourData.count)
		
		for i in 0..<colourData.count {
		
			let eachSwatch = UIView(frame: CGRect(x: swatchSize * CGFloat(i), y: 0, width: swatchSize, height: swatchSize))
			eachSwatch.backgroundColor = colourData[i].colourValue
			
			self.addSubview(eachSwatch)
		
		}
		
		
	
	}

}

class ColourController: UIViewController {

	let infoBar = InfoBar()
	let imageView = UIImageView()
	let scrollWindow = UIScrollView()
	let colourView = ColourGraphOne()
	let actionBar = ActionBar()

	override func viewDidLoad() {
	
		self.view.backgroundColor = UIColor.red
		imageView.backgroundColor = UIColor.blue
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		actionBar.translatesAutoresizingMaskIntoConstraints = false
		colourView.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(imageView)
		self.view.addSubview(colourView)
		self.view.addSubview(actionBar)

		self.view.addConstraints([
		
			// Image View
			NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 60),
			NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 0.66, constant: 0),
		
			// Colour View
			NSLayoutConstraint(item: colourView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: colourView, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: colourView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: colourView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150),
		
		
			// Action Bar
			NSLayoutConstraint(item: actionBar, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: actionBar, attribute: .bottom, multiplier: 1.0, constant: 30)
			
		])
		
		actionBar.linkButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkPressed)))
	
	}
	
	@objc func linkPressed() {
	
		downloadImage(imageLocation: "https://media3.architecturemedia.net/site_media/media/cache/53/18/5318713fb6d1aae167cbbdc652d7c762.jpg", completionHandler: { possibleImage in
			
			DispatchQueue.main.async {
				if possibleImage != nil {
					self.processImage(newImage: possibleImage!)
				} else {
					print("Bad image")
				}
			}

		})
	
	}
	
	func processImage(newImage: UIImage) {
	
		self.imageView.image = newImage
		
		if let pixelCFData = newImage.cgImage?.dataProvider?.data, let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelCFData) {
		
			var colourData: [ColourSample] = []
		
			for _ in 0...7 {
		
				let xCoord = Int(arc4random_uniform(UInt32(newImage.size.width)))
				let yCoord = Int(arc4random_uniform(UInt32(newImage.size.height)))
				let testPoint = CGPoint(x: xCoord, y: yCoord)
				let dataIndex = ((Int(newImage.size.width) * yCoord) + xCoord) * 4
				
				let r = CGFloat(data[dataIndex]) / CGFloat(255.0)
        		let g = CGFloat(data[dataIndex+1]) / CGFloat(255.0)
        		let b = CGFloat(data[dataIndex+2]) / CGFloat(255.0)
        		let a = CGFloat(data[dataIndex+3]) / CGFloat(255.0)
				
				print(r)
				print(g)
				print(b)
				print(a)
				
				colourData.append(ColourSample(redSample: r, greenSample: g, blueSample: b))
			
			}
			
			colourView.createSwatches(colourData: colourData)
		
		}
		
	}
	
	func downloadImage(imageLocation: String, completionHandler: @escaping(UIImage?) ->()) {
		
		if let imageURL = URL(string: imageLocation) {
		
			URLSession.shared.dataTask(with: URLRequest(url: imageURL, timeoutInterval: 30.0)) { returnData, returnResponse, returnError in
		
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

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = ColourController()



