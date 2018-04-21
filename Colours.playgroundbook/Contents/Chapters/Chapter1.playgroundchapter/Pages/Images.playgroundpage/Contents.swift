/*:
 ### So what's next?

 So we've learnt how individual pixels work by combining red, green and blue light to make a totally new colour. Let's take that and have a look at images. Images are basically just a big long list to tell each pixel how bright to make their red, green and blue lights. Before we go any further though, we're going to need an image to work with.

 Below is the `getImage` function. Tap on the `UIImage` button to select a local image (there are a few bundled with this playground), take a photo with your iPad's camera or alternatively, you can use the `downloadImage` function to get a photo from the web. Just delete `getImage` and select `downloadImage` from the shortcut bar.

 **Once you've got an image loaded, run the playground.**

 * callout(Slow code):
 When you run this section of code, it will take a few seconds before it is ready to run. This is to avoid a possible bug I may I have found with Swift Playground Books. I have provided a full explanation in the comments of my code on line 421.
*/
//#-hidden-code

import UIKit
import Foundation
import PlaygroundSupport

enum setColour {
	
	// Enumeration of the three colours of LED light.

    case Red, Green, Blue
}

class SmallLED: UIView {

	// Identical to the previous page's LED with the small exception of the scale factor for easily modifing the size of the LEDs.

	var colourBase: setColour
    var scaleFactor = 4.0
	
    var lightLayer = CAShapeLayer()
    var innerLayer = CAShapeLayer()
    var baseLayer = CAShapeLayer()
    var prongsLayer = CAShapeLayer()
	
    init(colourBase: setColour) {
        self.colourBase = colourBase
        super.init(frame: CGRect(x: 0, y: 0, width: 100 / scaleFactor, height: 200 / scaleFactor))
		
        let lightPath = UIBezierPath()
        lightPath.move(to: CGPoint(x: 7 / scaleFactor, y: 136 / scaleFactor))
        lightPath.addLine(to: CGPoint(x: 7 / scaleFactor, y: 45 / scaleFactor))
        lightPath.addCurve(to: CGPoint(x: 37 / scaleFactor, y: 15 / scaleFactor), controlPoint1: CGPoint(x: 7 / scaleFactor, y: 28 / scaleFactor), controlPoint2: CGPoint(x: 20 / scaleFactor, y: 15 / scaleFactor))
        lightPath.addLine(to: CGPoint(x: 63 / scaleFactor, y: 15 / scaleFactor))
        lightPath.addCurve(to: CGPoint(x: 93 / scaleFactor, y: 45 / scaleFactor), controlPoint1: CGPoint(x: 80 / scaleFactor, y: 15 / scaleFactor), controlPoint2: CGPoint(x: 93 / scaleFactor, y: 28 / scaleFactor))
        lightPath.addLine(to: CGPoint(x: 93 / scaleFactor, y: 136 / scaleFactor))
        lightPath.addLine(to: CGPoint(x: 7 / scaleFactor, y: 136 / scaleFactor))
        lightPath.close()
		
        let innerPath = UIBezierPath()
        innerPath.move(to: CGPoint(x: 26 / scaleFactor, y: 132 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 26 / scaleFactor, y: 128 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 23 / scaleFactor, y: 128 / scaleFactor))
        innerPath.addCurve(to: CGPoint(x: 20 / scaleFactor, y: 125 / scaleFactor), controlPoint1: CGPoint(x: 21 / scaleFactor, y: 128 / scaleFactor), controlPoint2: CGPoint(x: 20 / scaleFactor, y: 127 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 20 / scaleFactor, y: 119 / scaleFactor))
        innerPath.addCurve(to: CGPoint(x: 23 / scaleFactor, y: 116 / scaleFactor), controlPoint1: CGPoint(x: 20 / scaleFactor, y: 117 / scaleFactor), controlPoint2: CGPoint(x: 21 / scaleFactor, y: 116 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 75 / scaleFactor, y: 116 / scaleFactor))
        innerPath.addCurve(to: CGPoint(x: 78 / scaleFactor, y: 119 / scaleFactor), controlPoint1: CGPoint(x: 77 / scaleFactor, y: 116 / scaleFactor), controlPoint2: CGPoint(x: 78 / scaleFactor, y: 117 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 78 / scaleFactor, y: 125 / scaleFactor))
        innerPath.addCurve(to: CGPoint(x: 75 / scaleFactor, y: 128 / scaleFactor), controlPoint1: CGPoint(x: 78 / scaleFactor, y: 127 / scaleFactor), controlPoint2: CGPoint(x: 77 / scaleFactor, y: 128 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 72 / scaleFactor, y: 128 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 72 / scaleFactor, y: 132 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 60 / scaleFactor, y: 132 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 60 / scaleFactor, y: 128 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 38 / scaleFactor, y: 128 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 38 / scaleFactor, y: 132 / scaleFactor))
        innerPath.addLine(to: CGPoint(x: 26 / scaleFactor, y: 132 / scaleFactor))
        innerPath.close()
		
        let basePath = UIBezierPath()
        basePath.move(to: CGPoint(x: 4 / scaleFactor, y: 141 / scaleFactor))
        basePath.addLine(to: CGPoint(x: 4 / scaleFactor, y: 135 / scaleFactor))
        basePath.addCurve(to: CGPoint(x: 7 / scaleFactor, y: 132 / scaleFactor), controlPoint1: CGPoint(x: 4 / scaleFactor, y: 133 / scaleFactor), controlPoint2: CGPoint(x: 6 / scaleFactor, y: 132 / scaleFactor))
        basePath.addLine(to: CGPoint(x: 93 / scaleFactor, y: 132 / scaleFactor))
        basePath.addCurve(to: CGPoint(x: 96 / scaleFactor, y: 135 / scaleFactor), controlPoint1: CGPoint(x: 95 / scaleFactor, y: 132 / scaleFactor), controlPoint2: CGPoint(x: 96 / scaleFactor, y: 134 / scaleFactor))
        basePath.addLine(to: CGPoint(x: 96 / scaleFactor, y: 141 / scaleFactor))
        basePath.addLine(to: CGPoint(x: 4 / scaleFactor, y: 141 / scaleFactor))
        basePath.close()
		
        let prongsPath = UIBezierPath()
        prongsPath.move(to: CGPoint(x: 26 / scaleFactor, y: 141 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 26 / scaleFactor, y: 189 / scaleFactor))
        prongsPath.addCurve(to: CGPoint(x: 28 / scaleFactor, y: 191 / scaleFactor), controlPoint1: CGPoint(x: 26 / scaleFactor, y: 190 / scaleFactor), controlPoint2: CGPoint(x: 27 / scaleFactor, y: 191 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 36 / scaleFactor, y: 191 / scaleFactor))
        prongsPath.addCurve(to: CGPoint(x: 38 / scaleFactor, y: 189 / scaleFactor), controlPoint1: CGPoint(x: 37 / scaleFactor, y: 191 / scaleFactor), controlPoint2: CGPoint(x: 38 / scaleFactor, y: 190 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 38 / scaleFactor, y: 141 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 26 / scaleFactor, y: 141 / scaleFactor))
        prongsPath.move(to: CGPoint(x: 60 / scaleFactor, y: 141 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 60 / scaleFactor, y: 189 / scaleFactor))
        prongsPath.addCurve(to: CGPoint(x: 62 / scaleFactor, y: 191 / scaleFactor), controlPoint1: CGPoint(x: 60 / scaleFactor, y: 190 / scaleFactor), controlPoint2: CGPoint(x: 61 / scaleFactor, y: 191 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 70 / scaleFactor, y: 191 / scaleFactor))
        prongsPath.addCurve(to: CGPoint(x: 72 / scaleFactor, y: 189 / scaleFactor), controlPoint1: CGPoint(x: 71 / scaleFactor, y: 191 / scaleFactor), controlPoint2: CGPoint(x: 72 / scaleFactor, y: 190 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 72 / scaleFactor, y: 141 / scaleFactor))
        prongsPath.addLine(to: CGPoint(x: 70 / scaleFactor, y: 141 / scaleFactor))
        prongsPath.close
		
        lightLayer.path = lightPath.cgPath
        innerLayer.path = innerPath.cgPath
        baseLayer.path = basePath.cgPath
        prongsLayer.path = prongsPath.cgPath
		
        innerLayer.fillColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 0.54).cgColor
        baseLayer.fillColor = UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00).cgColor
        prongsLayer.fillColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1.00).cgColor
		
        switch colourBase {
			
            case .Red:
                lightLayer.fillColor = UIColor(red: 0.20, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
			
            case .Green:
                lightLayer.fillColor = UIColor(red: 0.00, green: 0.20, blue: 0.00, alpha: 1.00).cgColor
			
            case .Blue:
                lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.20, alpha: 1.00).cgColor
			
        }
		
        self.layer.addSublayer(lightLayer)
        self.layer.addSublayer(innerLayer)
        self.layer.addSublayer(baseLayer)
        self.layer.addSublayer(prongsLayer)
		
    }
	
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class ColourOutput: UIView {

	// Again, a similar setup to the previous page. Small difference in that the LEDs are now stored inside the ColourOutput view which made placement using contstrain layouts easier.

	var redLED = SmallLED(colourBase: .Red)
	var greenLED = SmallLED(colourBase: .Green)
	var blueLED = SmallLED(colourBase: .Blue)
	var wireLayer = CAShapeLayer()
	var outputLayer = CAShapeLayer()
	let redLabel = UILabel()
    let greenLabel = UILabel()
    let blueLabel = UILabel()
	
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		
		redLabel.text = ""
		greenLabel.text = ""
		blueLabel.text = ""
		redLabel.font = UIFont.boldSystemFont(ofSize: 12)
		greenLabel.font = UIFont.boldSystemFont(ofSize: 12)
		blueLabel.font = UIFont.boldSystemFont(ofSize: 12)
		redLabel.textColor = UIColor(red: 0.71, green: 0.16, blue: 0.12, alpha: 1.00)
		greenLabel.textColor = UIColor(red: 0.26, green: 0.81, blue: 0.68, alpha: 1.00)
		blueLabel.textColor = UIColor(red: 0.26, green: 0.69, blue: 0.97, alpha: 1.00)
		
		let wirePath = UIBezierPath()
		wirePath.move(to: CGPoint(x: 40, y: 44))
		wirePath.addLine(to: CGPoint(x: 10, y: 44))
		wirePath.addCurve(to: CGPoint(x: 10, y: 54), controlPoint1: CGPoint(x: 0, y: 44), controlPoint2: CGPoint(x: 0, y: 54))
		wirePath.addLine(to: CGPoint(x: 40, y: 54))
		wirePath.addCurve(to: CGPoint(x: 50, y: 64), controlPoint1: CGPoint(x: 45, y: 54), controlPoint2: CGPoint(x: 50, y: 59))
		wirePath.addLine(to: CGPoint(x: 50, y: 94))
		wirePath.addCurve(to: CGPoint(x: 40, y: 104), controlPoint1: CGPoint(x: 50, y: 99), controlPoint2: CGPoint(x: 45, y: 104))
		wirePath.addLine(to: CGPoint(x: 10, y: 104))
		wirePath.addCurve(to: CGPoint(x: 10, y: 114), controlPoint1: CGPoint(x: 0, y: 104), controlPoint2: CGPoint(x: 0, y: 114))
		wirePath.addLine(to: CGPoint(x: 40, y: 114))
		wirePath.addCurve(to: CGPoint(x: 50, y: 124), controlPoint1: CGPoint(x: 45, y: 114), controlPoint2: CGPoint(x: 50, y: 119))
		wirePath.addLine(to: CGPoint(x: 50, y: 154))
		wirePath.addCurve(to: CGPoint(x: 40, y: 164), controlPoint1: CGPoint(x: 50, y: 159), controlPoint2: CGPoint(x: 45, y: 164))
		wirePath.addLine(to: CGPoint(x: 10, y: 164))
		wirePath.addCurve(to: CGPoint(x: 10, y: 174), controlPoint1: CGPoint(x: 0, y: 164), controlPoint2: CGPoint(x: 0, y: 174))
		wirePath.addLine(to: CGPoint(x: 60, y: 174))
		wirePath.addLine(to: CGPoint(x: 60, y: 44))
		wirePath.addLine(to: CGPoint(x: 40, y: 44))
		wirePath.close()
		
		let outputPath = UIBezierPath()
		outputPath.move(to: CGPoint(x: 60, y: 44))
		outputPath.addLine(to: CGPoint(x: 60, y: 174))
		outputPath.addLine(to: CGPoint(x: 180, y: 174))
		outputPath.addCurve(to: CGPoint(x: 190, y: 164), controlPoint1: CGPoint(x: 185, y: 174), controlPoint2: CGPoint(x: 190, y: 169))
		outputPath.addLine(to: CGPoint(x: 190, y: 54))
		outputPath.addCurve(to: CGPoint(x: 180, y: 44), controlPoint1: CGPoint(x: 190, y: 49), controlPoint2: CGPoint(x: 185, y: 44))
		outputPath.addLine(to: CGPoint(x: 60, y: 44))
		
		wireLayer.path = wirePath.cgPath
		wireLayer.fillColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00).cgColor
		
		outputLayer.path = outputPath.cgPath
		outputLayer.fillColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00).cgColor
		
		self.layer.addSublayer(wireLayer)
		self.layer.addSublayer(outputLayer)
		
		redLED.translatesAutoresizingMaskIntoConstraints = false
		greenLED.translatesAutoresizingMaskIntoConstraints = false
		blueLED.translatesAutoresizingMaskIntoConstraints = false
		redLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(redLED)
		self.addSubview(greenLED)
		self.addSubview(blueLED)
		self.addSubview(redLabel)
        self.addSubview(greenLabel)
		self.addSubview(blueLabel)
		
		self.addConstraints([
		
			// Red LED
			NSLayoutConstraint(item: redLED, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: redLED, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: redLED, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 25),
			NSLayoutConstraint(item: redLED, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
			
			// Green LED
			NSLayoutConstraint(item: greenLED, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: greenLED, attribute: .top, relatedBy: .equal, toItem: redLED, attribute: .bottom, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: greenLED, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 25),
			NSLayoutConstraint(item: greenLED, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
			
			// Blue LED
			NSLayoutConstraint(item: blueLED, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: blueLED, attribute: .top, relatedBy: .equal, toItem: greenLED, attribute: .bottom, multiplier: 1.0, constant: 10),
			NSLayoutConstraint(item: blueLED, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 25),
			NSLayoutConstraint(item: blueLED, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50),
			
			// Red Label
			NSLayoutConstraint(item: redLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 14),
			NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: redLabel, attribute: .trailing, multiplier: 1.0, constant: 6),
			NSLayoutConstraint(item: redLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40),
			NSLayoutConstraint(item: redLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20),
			
			// Green Label
			NSLayoutConstraint(item: greenLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 74),
			NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: greenLabel, attribute: .trailing, multiplier: 1.0, constant: 6),
			NSLayoutConstraint(item: greenLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40),
			NSLayoutConstraint(item: greenLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20),
			
			// Blue Label
			NSLayoutConstraint(item: blueLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 134),
			NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: blueLabel, attribute: .trailing, multiplier: 1.0, constant: 6),
			NSLayoutConstraint(item: blueLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40),
			NSLayoutConstraint(item: blueLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20)
		
		])
		
	}
	
	required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class PageThree: UIViewController {

	// The main view controller. There are some interesting values that are being stored in this VC but I have talked in further detail about them lower down where they relate more to the slowness of this page. I also created the leading and bottom constraints for the location cross here so they are accessible for update though the controller reference.

	var imageView = UIImageView()
	var verticalSlider = UISlider()
	var horizontalSlider = UISlider()
	var verticalIndicator = UIView()
	var horizontalIndicator = UIView()
	var colourOutput = ColourOutput()
	
	var setData: Array<UInt8>? = nil
	var setSize: CGSize? = CGSize(width: 300, height: 200)
	var setImage: UIImage? = nil
	
	var bytesPerRow: Int? = nil
	var bytesPerPixel: Int? = nil
	
	var trackVertical = NSLayoutConstraint()
	var trackHorizontal = NSLayoutConstraint()

	override func viewDidLoad() {
		super.viewDidLoad()
	
		imageView.image = UIImage(named: "Frame")
	
		self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
		imageView.backgroundColor = UIColor(red: 0.30, green: 0.30, blue: 0.30, alpha: 1.00)
		verticalIndicator.backgroundColor = UIColor(red: 0.94, green: 0.43, blue: 0.13, alpha: 1.00)
		horizontalIndicator.backgroundColor = UIColor(red: 0.94, green: 0.43, blue: 0.13, alpha: 1.00)
		
		verticalSlider.minimumTrackTintColor = UIColor(red: 0.94, green: 0.43, blue: 0.13, alpha: 1.00)
		verticalSlider.maximumTrackTintColor = UIColor(red: 0.94, green: 0.43, blue: 0.13, alpha: 1.00)
		horizontalSlider.minimumTrackTintColor = UIColor(red: 0.94, green: 0.43, blue: 0.13, alpha: 1.00)
		horizontalSlider.maximumTrackTintColor = UIColor(red: 0.94, green: 0.43, blue: 0.13, alpha: 1.00)
		
		verticalSlider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
		verticalSlider.maximumValue = 1.0
		verticalSlider.minimumValue = 0.0
		horizontalSlider.maximumValue = 1.0
		horizontalSlider.minimumValue = 0.0
		
		verticalIndicator.translatesAutoresizingMaskIntoConstraints = false
		horizontalIndicator.translatesAutoresizingMaskIntoConstraints = false
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		verticalSlider.translatesAutoresizingMaskIntoConstraints = false
		horizontalSlider.translatesAutoresizingMaskIntoConstraints = false
		colourOutput.translatesAutoresizingMaskIntoConstraints = false
		
		imageView.addSubview(verticalIndicator)
		imageView.addSubview(horizontalIndicator)
		
		self.view.addSubview(imageView)
		self.view.addSubview(horizontalSlider)
		self.view.addSubview(verticalSlider)
		self.view.addSubview(colourOutput)
		
		trackVertical = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: verticalIndicator, attribute: .bottom, multiplier: 1.0, constant: 0)
		trackHorizontal = NSLayoutConstraint(item: horizontalIndicator, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .leading, multiplier: 1.0, constant: 0)
		
		imageView.addConstraints([
		
			// Vertical Indicator
			trackVertical,
			NSLayoutConstraint(item: verticalIndicator, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: verticalIndicator, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1),
			NSLayoutConstraint(item: verticalIndicator, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1.0, constant: 0),
		
			// Horizontal Indicator
			trackHorizontal,
			NSLayoutConstraint(item: horizontalIndicator, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .top, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: horizontalIndicator, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: horizontalIndicator, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1)
			
		])
		
		self.view.addConstraints([
		
			// Image View
			NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 0.66, constant: 0),
			
			// Vertical Slider
			NSLayoutConstraint(item: verticalSlider, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: verticalSlider, attribute: .centerY, relatedBy: .equal, toItem: imageView, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: verticalSlider, attribute: .centerX, relatedBy: .equal, toItem: imageView, attribute: .left, multiplier: 1.0, constant: -25),
			
			// Horizontal Slider
			NSLayoutConstraint(item: horizontalSlider, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: horizontalSlider, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 15),
			NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: horizontalSlider, attribute: .trailing, multiplier: 1.0, constant: 0),
			
			// Colour Output
			NSLayoutConstraint(item: colourOutput, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: colourOutput, attribute: .top, relatedBy: .equal, toItem: horizontalSlider, attribute: .bottom, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: colourOutput, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200),
			NSLayoutConstraint(item: colourOutput, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
			
		])
		
		horizontalSlider.addTarget(self, action: #selector(slideChanged(_:)), for: .valueChanged)
		verticalSlider.addTarget(self, action: #selector(slideChanged(_:)), for: .valueChanged)
		
	}
	
	func presentError(errorMessage: String) {
	
		// Because image download and manipulation is not perfect (and because there is no verification that the URL being provided links directly to an image), I added this function to communicate errors with the user.
	
		let popupAlert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
		popupAlert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
		self.present(popupAlert, animated: true, completion: nil)
	
	}
	
	@objc func slideChanged(_ sender: UISlider!) {
	
		// One size fits all function for when the UISliders update. This function takes the converted pixel data and pulls out the relevant RGB values. Because the bounds of the sliders were from 0 to 1 inclusive, I had to subtract one from the height and width values when I was using them for calculations. I used a combination of the answers from this stack overflow question (https://stackoverflow.com/questions/25146557/how-do-i-get-the-color-of-a-pixel-in-a-uiimage-with-swift) to pull the correct pixel data.
		
		trackVertical.constant = CGFloat(verticalSlider.value) * imageView.frame.height - 1
		trackHorizontal.constant = CGFloat(horizontalSlider.value) * imageView.frame.width - 1
		
		if setSize != nil && setData != nil && bytesPerPixel != nil && bytesPerRow != nil {
		
			let xCoord = Int(round(Float(setSize!.width - 1) * horizontalSlider.value))
			let yCoord = Int(round(Float(setSize!.height - 1) - (Float(setSize!.height - 1) * verticalSlider.value)))

			let dataIndex = ((bytesPerRow! * yCoord) + xCoord * bytesPerPixel!)

			let redValue = CGFloat(setData![dataIndex]) / CGFloat(255.0)
			let greenValue = CGFloat(setData![dataIndex + 1]) / CGFloat(255.0)
			let blueValue = CGFloat(setData![dataIndex + 2]) / CGFloat(255.0)
			
			colourOutput.redLED.lightLayer.fillColor = UIColor(red: redValue, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
			colourOutput.greenLED.lightLayer.fillColor = UIColor(red: 0.0, green: greenValue, blue: 0.0, alpha: 1.0).cgColor
			colourOutput.blueLED.lightLayer.fillColor = UIColor(red: 0.0, green: 0.0, blue: blueValue, alpha: 1.0).cgColor
			colourOutput.outputLayer.fillColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0).cgColor

			colourOutput.redLabel.text = String(format: "%.2f", redValue)
			colourOutput.greenLabel.text = String(format: "%.2f", greenValue)
			colourOutput.blueLabel.text = String(format: "%.2f", blueValue)
		
		} else {
			
			colourOutput.redLabel.text = "Error"
			colourOutput.greenLabel.text = "Error"
			colourOutput.blueLabel.text = "Error"
			
		}
	}
	
}

let CurrentPage = PageThree()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = CurrentPage

func getImage(file: UIImage) {

	// This is the main function in question when it comes to looking at why this section of code is so slow. The main culperit is on line 436 where the code converts an UnsafePointer<UInt8> object into an UnsafeBufferPointer and then finaly into an Array<UInt8>. I'll reference again the stack overflow page (https://stackoverflow.com/questions/25146557/how-do-i-get-the-color-of-a-pixel-in-a-uiimage-with-swift) where I found the method to convert the image into an UnsafePointer object. I wrote all of my code in a Swift Playground file on my laptop and then copied the code out into a Swift Playground Book and then ran it on my iPad. What I found was that when I was using the Swift Playground on my Mac, leaving the pixel data as an UnsafePointer<UInt8> worked completely fine, it was a lot faster and I was able to store it in my CurrentPage object and pull values from it using the UISliders. When I directly copied the code over into the Swift Playground Book however where there was zero change in the code, I found that I could convert the data without issue but as soon as I tried to access the data I was getting index not found errors on all indexes. I have read through the documentation so I can see what is there about the way UnsafePointers store data in memory but it just didn't make sense that the exact same code was running on a computer but not on my iPad. The only way I could get the pixel data to not give index not found errors when trying to access a value was by converting the UnsafePointer to an Array which takes a lot of time from what I am assuming is the very large size of the UnsafePointer objects (1 000 000+ values). I would definitely have liked to have found a better and quicker approach but because of the time constraint of this competition, I was unable to do so.
	
	// As for the rest of this code, the getImage function is one of two functions that are exposed to the user for input. As well as getting the afformentioned pixel data, this function also pulls out some other useful information about the image file such as it's size and pixel counts. This information is used for converting the x and y values of the UISliders to the scale of the original image. This function finishes by running the same block of code as the slider update function to pull a value from 0.4, 0.4 and also moves the tracking indicators to that location as well. This is to help visually comunicate how the playground works.

	CurrentPage.verticalSlider.isEnabled = false
	CurrentPage.horizontalSlider.isEnabled = false
	CurrentPage.verticalIndicator.alpha = 0
	CurrentPage.horizontalIndicator.alpha = 0
	
	if let imageCG = file.cgImage, let imageData = imageCG.dataProvider?.data, let pixelData: UnsafePointer<UInt8> = CFDataGetBytePtr(imageData) {
		
		CurrentPage.imageView.image = file
		CurrentPage.setImage = file
		CurrentPage.setSize = file.size
		CurrentPage.bytesPerRow = imageCG.bytesPerRow
		CurrentPage.bytesPerPixel = imageCG.bitsPerPixel / 8
		
		CurrentPage.setData = Array(UnsafeBufferPointer(start: pixelData, count: imageCG.bytesPerRow * Int(file.size.height)))
		
		CurrentPage.verticalSlider.isEnabled = true
		CurrentPage.horizontalSlider.isEnabled = true
		CurrentPage.verticalIndicator.alpha = 1
		CurrentPage.horizontalIndicator.alpha = 1

		let xCoord = 0
		let yCoord = Int(file.size.height - 1)

		let dataIndex = ((CurrentPage.bytesPerRow! * yCoord) + xCoord * CurrentPage.bytesPerPixel!)

		let redValue = CGFloat(CurrentPage.setData![dataIndex]) / CGFloat(255.0)
		let greenValue = CGFloat(CurrentPage.setData![dataIndex + 1]) / CGFloat(255.0)
		let blueValue = CGFloat(CurrentPage.setData![dataIndex + 2]) / CGFloat(255.0)
		
		CurrentPage.colourOutput.redLED.lightLayer.fillColor = UIColor(red: redValue, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
		CurrentPage.colourOutput.greenLED.lightLayer.fillColor = UIColor(red: 0.0, green: greenValue, blue: 0.0, alpha: 1.0).cgColor
		CurrentPage.colourOutput.blueLED.lightLayer.fillColor = UIColor(red: 0.0, green: 0.0, blue: blueValue, alpha: 1.0).cgColor
		CurrentPage.colourOutput.outputLayer.fillColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0).cgColor

		CurrentPage.colourOutput.redLabel.text = String(format: "%.2f", redValue)
		CurrentPage.colourOutput.greenLabel.text = String(format: "%.2f", greenValue)
		CurrentPage.colourOutput.blueLabel.text = String(format: "%.2f", blueValue)


	} else {
		CurrentPage.presentError(errorMessage: "Unable to convert image data. Please try again.")
	}
	
}

func handleDownload(url: String, completion: @escaping(UIImage?, String) -> ()) {

	// The handleDownload function is the function that actually does all of the work for the download of external images but because it contains a completion handler for the asynchronous return of data, I have hidden it so that the user is not exposed to that side of the code.

	if let imageURL = URL(string: url) {
	
		URLSession.shared.dataTask(with: URLRequest(url: imageURL, timeoutInterval: 30.0)) { returnData, returnResponse, returnError in
	
			if returnError == nil {
			
				if let finalData = returnData, let finalImage = UIImage(data: finalData) {
					completion(finalImage, "Successful download")
				} else {
					completion(nil, "Problem converting web data to image.")
				}
			} else {
				completion(nil, "Download task returned error: \(returnError.debugDescription).")
			}

		}.resume()

	} else {
		completion(nil, "Invalid URL")
	}

}

func downloadImage(url: String) {

	// The second function that is exposed to the user, it calls the handleDownload to do the actualy download work and then calls the getImage function on the returned image. If there was an error with the download, it presents it as an alert.

	CurrentPage.verticalSlider.isEnabled = false
	CurrentPage.horizontalSlider.isEnabled = false
	CurrentPage.verticalIndicator.alpha = 0
	CurrentPage.horizontalIndicator.alpha = 0

	handleDownload(url: url, completion: { returnedImage, returnedString in
		DispatchQueue.main.async {

			if returnedImage != nil {
		
				getImage(file: returnedImage!)
				
			} else {
				CurrentPage.presentError(errorMessage: returnedString)
			}

		}
	})

}

//#-end-hidden-code
//#-editable-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, downloadImage(url:), getImage(file:))
getImage(file: <#T##UIImage#>)
//#-end-editable-code
/*:
 After everything has loaded and you can see your image on the right, you can start exploring this playground. Move the horizontal and vertical indicators (the two orange bars) around the image and as you do so, the little red, green and blue pixel indicator from the last exercise will light up and change colours.

#### Exercises
 * Have a play with the sliders. What colour is in the top right hand corner? What about the bottom left?
 * Try and find a flat patch of colour in an image and move the pointer there. What can you see? Are the pixels all the same colour?
 * Find a spot in the image on the edge of an object. What do you notice about the colour transition from one object to another?
*/


