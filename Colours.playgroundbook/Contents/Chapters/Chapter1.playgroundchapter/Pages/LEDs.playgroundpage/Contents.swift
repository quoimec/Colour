/*:
 ### Welcome!

 As you've just read, every single pixel on your screen is made up of a red light, a green light, and a blue light. This exercise will help you understand how your screen mixes those lights to make new colours.


 * callout(Run the playground):
 If you're on an iPad, you'll need to run the playground before you can see anything.


 Once you've run the playground you should see three lights. They represent one pixel in your screen.

 Below that is a yellowish square. This is where the three lights will output the colour they combine to make.

 Alright! Let's get coding. If you look below you should see three functions: `updateRed`, `updateGreen`, and `updateBlue`. Each of these functions will change the brightness of the corresponding light. If you want to turn a light off, set the number to `0.0`. If you want a light to be as bright as possible, set it to `1.0`.


 * callout(Accepted values):
 Technically, the update functions will accept any number as input but for our purposes anything greater than `1.0` will be rounded back down to `1.0` and the inverse goes for `0.0`. Safety first y'all!

*/
//#-hidden-code

import UIKit
import PlaygroundSupport

enum setColour {
	case Red, Green, Blue
}

class colourLED: UIView {

	var colourBase: setColour
	var colourValue = 1.00
	
	var lightLayer = CAShapeLayer()
	var innerLayer = CAShapeLayer()
	var baseLayer = CAShapeLayer()
	var prongsLayer = CAShapeLayer()
	
	init(colourBase: setColour) {
		self.colourBase = colourBase
		super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
		
		let lightPath = UIBezierPath()
		lightPath.move(to: CGPoint(x: 7, y: 136))
		lightPath.addLine(to: CGPoint(x: 7, y: 45))
		lightPath.addCurve(to: CGPoint(x: 37, y: 15), controlPoint1: CGPoint(x: 7, y: 28), controlPoint2: CGPoint(x: 20, y: 15))
		lightPath.addLine(to: CGPoint(x: 63, y: 15))
		lightPath.addCurve(to: CGPoint(x: 93, y: 45), controlPoint1: CGPoint(x: 80, y: 15), controlPoint2: CGPoint(x: 93, y: 28))
		lightPath.addLine(to: CGPoint(x: 93, y: 136))
		lightPath.addLine(to: CGPoint(x: 7, y: 136))
		lightPath.close()
		
		let innerPath = UIBezierPath()
		innerPath.move(to: CGPoint(x: 26, y: 132))
		innerPath.addLine(to: CGPoint(x: 26, y: 128))
		innerPath.addLine(to: CGPoint(x: 23, y: 128))
		innerPath.addCurve(to: CGPoint(x: 20, y: 125), controlPoint1: CGPoint(x: 21, y: 128), controlPoint2: CGPoint(x: 20, y: 127))
		innerPath.addLine(to: CGPoint(x: 20, y: 119))
		innerPath.addCurve(to: CGPoint(x: 23, y: 116), controlPoint1: CGPoint(x: 20, y: 117), controlPoint2: CGPoint(x: 21, y: 116))
		innerPath.addLine(to: CGPoint(x: 75, y: 116))
		innerPath.addCurve(to: CGPoint(x: 78, y: 119), controlPoint1: CGPoint(x: 77, y: 116), controlPoint2: CGPoint(x: 78, y: 117))
		innerPath.addLine(to: CGPoint(x: 78, y: 125))
		innerPath.addCurve(to: CGPoint(x: 75, y: 128), controlPoint1: CGPoint(x: 78, y: 127), controlPoint2: CGPoint(x: 77, y: 128))
		innerPath.addLine(to: CGPoint(x: 72, y: 128))
		innerPath.addLine(to: CGPoint(x: 72, y: 132))
		innerPath.addLine(to: CGPoint(x: 60, y: 132))
		innerPath.addLine(to: CGPoint(x: 60, y: 128))
		innerPath.addLine(to: CGPoint(x: 38, y: 128))
		innerPath.addLine(to: CGPoint(x: 38, y: 132))
		innerPath.addLine(to: CGPoint(x: 26, y: 132))
		innerPath.close()
		
		let basePath = UIBezierPath()
		basePath.move(to: CGPoint(x: 4, y: 141))
		basePath.addLine(to: CGPoint(x: 4, y: 135))
		basePath.addCurve(to: CGPoint(x: 7, y: 132), controlPoint1: CGPoint(x: 4, y: 133), controlPoint2: CGPoint(x: 6, y: 132))
		basePath.addLine(to: CGPoint(x: 93, y: 132))
		basePath.addCurve(to: CGPoint(x: 96, y: 135), controlPoint1: CGPoint(x: 95, y: 132), controlPoint2: CGPoint(x: 96, y: 134))
		basePath.addLine(to: CGPoint(x: 96, y: 141))
		basePath.addLine(to: CGPoint(x: 4, y: 141))
		basePath.close()
		
		let prongsPath = UIBezierPath()
		prongsPath.move(to: CGPoint(x: 26, y: 141))
		prongsPath.addLine(to: CGPoint(x: 26, y: 189))
		prongsPath.addCurve(to: CGPoint(x: 28, y: 191), controlPoint1: CGPoint(x: 26, y: 190), controlPoint2: CGPoint(x: 27, y: 191))
		prongsPath.addLine(to: CGPoint(x: 36, y: 191))
		prongsPath.addCurve(to: CGPoint(x: 38, y: 189), controlPoint1: CGPoint(x: 37, y: 191), controlPoint2: CGPoint(x: 38, y: 190))
		prongsPath.addLine(to: CGPoint(x: 38, y: 141))
		prongsPath.addLine(to: CGPoint(x: 26, y: 141))
		prongsPath.move(to: CGPoint(x: 60, y: 141))
		prongsPath.addLine(to: CGPoint(x: 60, y: 189))
		prongsPath.addCurve(to: CGPoint(x: 62, y: 191), controlPoint1: CGPoint(x: 60, y: 190), controlPoint2: CGPoint(x: 61, y: 191))
		prongsPath.addLine(to: CGPoint(x: 70, y: 191))
		prongsPath.addCurve(to: CGPoint(x: 72, y: 189), controlPoint1: CGPoint(x: 71, y: 191), controlPoint2: CGPoint(x: 72, y: 190))
		prongsPath.addLine(to: CGPoint(x: 72, y: 141))
		prongsPath.addLine(to: CGPoint(x: 70, y: 141))
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
			colourValue = 0.82
			lightLayer.fillColor = UIColor(red: 0.82, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
			
			case .Green:
			colourValue = 0.38
			lightLayer.fillColor = UIColor(red: 0.00, green: 0.38, blue: 0.00, alpha: 1.00).cgColor
			
			case .Blue:
			colourValue = 0.88
			lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.88, alpha: 1.00).cgColor
		
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

class PageTwo: UIView {

	let redLight = colourLED(colourBase: .Red)
	let greenLight = colourLED(colourBase: .Green)
	let blueLight = colourLED(colourBase: .Blue)
	let colourSquare = UIView()
	let colourLabel = UILabel()

	init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
		
		self.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
		colourSquare.layer.cornerRadius = 16.0
		
		colourLabel.text = "Colour Result:"
		colourLabel.font = UIFont.boldSystemFont(ofSize: 20)
		colourLabel.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
		colourLabel.textAlignment = .center
		
		redLight.translatesAutoresizingMaskIntoConstraints = false
		greenLight.translatesAutoresizingMaskIntoConstraints = false
		blueLight.translatesAutoresizingMaskIntoConstraints = false
		colourSquare.translatesAutoresizingMaskIntoConstraints = false
		colourLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(redLight)
		self.addSubview(greenLight)
		self.addSubview(blueLight)
		self.addSubview(colourSquare)
		self.addSubview(colourLabel)
		
		self.addConstraints([
		
			// Red Light
			NSLayoutConstraint(item: redLight, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: redLight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200),
			NSLayoutConstraint(item: redLight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100),
			
			// Green Light
			NSLayoutConstraint(item: greenLight, attribute: .leading, relatedBy: .equal, toItem: redLight, attribute: .trailing, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: greenLight, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: greenLight, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: greenLight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200),
			NSLayoutConstraint(item: greenLight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100),
		
			// Blue Light
			NSLayoutConstraint(item: blueLight, attribute: .leading, relatedBy: .equal, toItem: greenLight, attribute: .trailing, multiplier: 1.0, constant: 20),
			NSLayoutConstraint(item: blueLight, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 50),
			NSLayoutConstraint(item: blueLight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200),
			NSLayoutConstraint(item: blueLight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100),
			
			// Colour Square
			NSLayoutConstraint(item: colourSquare, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: colourSquare, attribute: .top, relatedBy: .equal, toItem: greenLight, attribute: .bottom, multiplier: 1.0, constant: 80),
			NSLayoutConstraint(item: colourSquare, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250),
			NSLayoutConstraint(item: colourSquare, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250),
			
			// Colour Label
			NSLayoutConstraint(item: colourLabel, attribute: .leading, relatedBy: .equal, toItem: colourSquare, attribute: .leading, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: colourLabel, attribute: .trailing, relatedBy: .equal, toItem: colourSquare, attribute: .trailing, multiplier: 1.0, constant: 0),
			NSLayoutConstraint(item: colourSquare, attribute: .top, relatedBy: .equal, toItem: colourLabel, attribute: .bottom, multiplier: 1.0, constant: 10)

		])
	
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

let pageTwoView = PageTwo()

func updateRed(lightBrightness: Double) {

	if lightBrightness > 1.00 {
		pageTwoView.redLight.colourValue = 1.00
		pageTwoView.redLight.lightLayer.fillColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
	} else if lightBrightness < 0.00 {
		pageTwoView.redLight.colourValue = 0.00
		pageTwoView.redLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
	} else {
		pageTwoView.redLight.colourValue = lightBrightness
		pageTwoView.redLight.lightLayer.fillColor = UIColor(red: CGFloat(lightBrightness), green: 0.00, blue: 0.00, alpha: 1.00).cgColor
	}

}

func updateGreen(lightBrightness: Double) {

	if lightBrightness > 1.00 {
		pageTwoView.greenLight.colourValue = 1.00
		pageTwoView.greenLight.lightLayer.fillColor = UIColor(red: 0.00, green: 1.00, blue: 0.00, alpha: 1.00).cgColor
	} else if lightBrightness < 0.00 {
		pageTwoView.greenLight.colourValue = 0.00
		pageTwoView.greenLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
	} else {
		pageTwoView.greenLight.colourValue = lightBrightness
		pageTwoView.greenLight.lightLayer.fillColor = UIColor(red: 0.00, green: CGFloat(lightBrightness), blue: 0.00, alpha: 1.00).cgColor
	}

}

func updateBlue(lightBrightness: Double) {

	if lightBrightness > 1.00 {
		pageTwoView.blueLight.colourValue = 1.00
		pageTwoView.blueLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
	} else if lightBrightness < 0.00 {
		pageTwoView.blueLight.colourValue = 0.00
		pageTwoView.blueLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
	} else {
		pageTwoView.blueLight.colourValue = lightBrightness
		pageTwoView.blueLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: CGFloat(lightBrightness), alpha: 1.00).cgColor
	}

}

PlaygroundPage.current.liveView = pageTwoView

//#-end-hidden-code

updateRed(lightBrightness: /*#-editable-code*/0.99/*#-end-editable-code*/)
updateGreen(lightBrightness: /*#-editable-code*/0.82/*#-end-editable-code*/)
updateBlue(lightBrightness: /*#-editable-code*/0.44/*#-end-editable-code*/)

/*:
 #### Exercises
 * Can you make our pixel output purple? What about light blue?
 * What happens when you set all three values to `1.0`? What about `0.0`?
 * What combination of numbers do you need to make a murky brown colour?
*/
//#-hidden-code

pageTwoView.colourSquare.backgroundColor = UIColor(red: CGFloat(pageTwoView.redLight.colourValue), green: CGFloat(pageTwoView.greenLight.colourValue), blue: CGFloat(pageTwoView.blueLight.colourValue), alpha: 1.00)

//#-end-hidden-code


