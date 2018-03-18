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
		
		self.backgroundColor = UIColor.red
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
	let LineContainer = UIView()
	let GraphZero = UILabel()
	let GraphOne = UILabel()
	
	init() {
		super.init(frame: CGRect.zero)
	
		self.backgroundColor = UIColor.white
		
		GraphTitle.text = "Random Swatches"
		GraphTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		GraphTitle.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
		
		GraphZero.text = "0"
		GraphOne.text = "1"
		GraphZero.font = UIFont.systemFont(ofSize: 6, weight: .heavy)
		GraphOne.font = UIFont.systemFont(ofSize: 6, weight: .heavy)
		GraphZero.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
		GraphOne.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
		GraphZero.textAlignment = .center
		GraphOne.textAlignment = .center
		
		SwatchContainer.backgroundColor = UIColor.green
		LineContainer.backgroundColor = UIColor.white
		
		GraphTitle.translatesAutoresizingMaskIntoConstraints = false
		SwatchContainer.translatesAutoresizingMaskIntoConstraints = false
		LineContainer.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(GraphTitle)
		self.addSubview(SwatchContainer)
		self.addSubview(LineContainer)
		
		self.addConstraints([
		
			// Graph Title
			NSLayoutConstraint(item: GraphTitle, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: GraphTitle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: GraphTitle, attribute: .trailing, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: GraphTitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 34),
			
			// Swatch Container
			NSLayoutConstraint(item: SwatchContainer, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: SwatchContainer, attribute: .top, relatedBy: .equal, toItem: GraphTitle, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: SwatchContainer, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: SwatchContainer, attribute: .height, relatedBy: .equal, toItem: SwatchContainer, attribute: .width, multiplier: 0.125, constant: 0),
			
			
			// Line Container
			NSLayoutConstraint(item: LineContainer, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: LineContainer, attribute: .top, relatedBy: .equal, toItem: SwatchContainer, attribute: .bottom, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: LineContainer, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: LineContainer, attribute: .bottom, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: LineContainer, attribute: .height, relatedBy: .equal, toItem: LineContainer, attribute: .width, multiplier: 0.125, constant: 0)
			
			
		])
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func createSwatches(colourData: [ColourSample]) {
	
		print("Create Swatches")
	
		let swatchSize = self.frame.width / CGFloat(colourData.count)
		let startingX = swatchSize / 2
		
		let graphLayer = CAShapeLayer()
		let redLayer = CAShapeLayer()
		let greenLayer = CAShapeLayer()
		let blueLayer = CAShapeLayer()
		
		var graphLine = UIBezierPath()
		var redLine = UIBezierPath()
		var greenLine = UIBezierPath()
		var blueLine = UIBezierPath()
		
		for i in 0..<colourData.count {
		
			let eachSwatch = UIView(frame: CGRect(x: swatchSize * CGFloat(i), y: 0, width: swatchSize, height: swatchSize))
			eachSwatch.backgroundColor = colourData[i].colourValue
			SwatchContainer.addSubview(eachSwatch)
			
			if i == 0 {
				redLine.move(to: CGPoint(x: startingX, y: swatchSize - (colourData[0].redSample * swatchSize)))
				greenLine.move(to: CGPoint(x: startingX, y: swatchSize - (colourData[0].greenSample * swatchSize)))
				blueLine.move(to: CGPoint(x: startingX, y: swatchSize - (colourData[0].blueSample * swatchSize)))
			} else {
				redLine.addLine(to: CGPoint(x: startingX + (swatchSize * CGFloat(i)), y: swatchSize - (colourData[i].redSample * swatchSize)))
				greenLine.addLine(to: CGPoint(x: startingX + (swatchSize * CGFloat(i)), y: swatchSize - (colourData[i].greenSample * swatchSize)))
				blueLine.addLine(to: CGPoint(x: startingX + (swatchSize * CGFloat(i)), y: swatchSize - (colourData[i].blueSample * swatchSize)))
			}
	
		}
		
		GraphZero.frame = CGRect(x: 0, y: swatchSize - 10, width: startingX, height: 10)
		GraphOne.frame = CGRect(x: 0, y: 0, width: startingX, height: 10)
		
		graphLine.move(to: CGPoint(x: startingX, y: 0))
		graphLine.addLine(to: CGPoint(x: startingX, y: swatchSize))
		graphLine.addLine(to: CGPoint(x: self.frame.width - startingX, y: swatchSize))
		
		graphLayer.path = graphLine.cgPath
		graphLayer.strokeColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 0.40).cgColor
		graphLayer.fillColor = UIColor.clear.cgColor
		graphLayer.lineWidth = 1.0
		
		redLayer.path = redLine.cgPath
		redLayer.strokeColor = UIColor.red.cgColor
		redLayer.fillColor = UIColor.clear.cgColor
		redLayer.lineWidth = 2.0
		
		greenLayer.path = greenLine.cgPath
		greenLayer.strokeColor = UIColor.green.cgColor
		greenLayer.fillColor = UIColor.clear.cgColor
		greenLayer.lineWidth = 2.0
		
		blueLayer.path = blueLine.cgPath
		blueLayer.strokeColor = UIColor.blue.cgColor
		blueLayer.fillColor = UIColor.clear.cgColor
		blueLayer.lineWidth = 2.0
		
		LineContainer.layer.sublayers = [graphLayer]
		LineContainer.layer.addSublayer(redLayer)
		LineContainer.layer.addSublayer(greenLayer)
		LineContainer.layer.addSublayer(blueLayer)
		
		if LineContainer.subviews.count == 0 {
			LineContainer.addSubview(GraphZero)
			LineContainer.addSubview(GraphOne)
		} else {
			print("Helloooo")
		}
		
	}

}

class ColourScroll: UIScrollView {

	let graphOne = ColourGraphOne()
	let graphTwo = ColourGraphOne()
	let graphThree = ColourGraphOne()
	
	init() {
		super.init(frame: CGRect.zero)
		
		self.backgroundColor = UIColor.orange
		self.isScrollEnabled = true
		
		graphOne.translatesAutoresizingMaskIntoConstraints = false
		graphTwo.translatesAutoresizingMaskIntoConstraints = false
		graphThree.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(graphOne)
		self.addSubview(graphTwo)
		self.addSubview(graphThree)
		
		self.addConstraints([
		
			// Graph One
			NSLayoutConstraint(item: graphOne, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: graphOne, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: graphOne, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: graphOne, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0),
			
			// Graph Two
			NSLayoutConstraint(item: graphTwo, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: graphTwo, attribute: .top, relatedBy: .equal, toItem: graphOne, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: graphTwo, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: graphTwo, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0),
			
			// Graph Three
			NSLayoutConstraint(item: graphThree, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: graphThree, attribute: .top, relatedBy: .equal, toItem: graphTwo, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: graphThree, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: graphThree, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: graphThree, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0)
		
		])
	
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func updateGraphs(colourData: [ColourSample]) {
	
		graphOne.createSwatches(colourData: colourData)
	
	}
	
}

class ColourController: UIViewController {

	let infoBar = InfoBar()
	let imageView = UIImageView()
	let scrollWindow = ColourScroll()
	let actionBar = ActionBar()

	override func viewDidLoad() {
	
		self.view.backgroundColor = UIColor.red
		imageView.backgroundColor = UIColor.blue
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		scrollWindow.translatesAutoresizingMaskIntoConstraints = false
		actionBar.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(imageView)
		self.view.addSubview(scrollWindow)
		self.view.addSubview(actionBar)

		self.view.addConstraints([
		
			// Image View
			NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 60),
			NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 0.66, constant: 0),
			
			// Scroll Window
			NSLayoutConstraint(item: scrollWindow, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: scrollWindow, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: scrollWindow, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: scrollWindow, attribute: .bottom, multiplier: 1.0, constant: 0),
		
			// Action Bar
			NSLayoutConstraint(item: actionBar, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: actionBar, attribute: .bottom, multiplier: 1.0, constant: 30)
			
		])
		
		actionBar.linkButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkPressed)))
	
	}
	
	@objc func linkPressed() {
	
		downloadImage(imageLocation: "http://media.idownloadblog.com/wp-content/uploads/2014/08/Yosemite-4-wallpaper-thumbnail.png", completionHandler: { possibleImage in
			
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
	
		print("Process Start")
	
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
			
				colourData.append(ColourSample(redSample: r, greenSample: g, blueSample: b))
			
			}
			
			print("Process Finish")
			
			scrollWindow.updateGraphs(colourData: colourData)
		
		}
		
	}
	
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

}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = ColourController()



