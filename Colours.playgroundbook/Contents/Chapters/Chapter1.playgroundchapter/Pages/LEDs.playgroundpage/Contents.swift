/*:
 ### Welcome!

 So as you've just read, every single pixel on your screen is made up of a red light, a green light, and a blue light. This exercise will help you understand how your screen mixes those lights to make new colours.


 * callout(Run the playground):
 If you're on an iPad, you'll need to run the playground before you can see anything.


 Once you've run the playground you should see three lights, they represent one pixel that lives in your screen.

 Below that is a yellowish square. This is our output zone which shows the the combination of the red, green and blue lights.

 Alright! Let's start playing with some code. You've got three functions that you can use: `updateRed`, `updateGreen`, and `updateBlue`. Each of these functions will change the brightness of the corresponding light. If you want to turn a light off, set the number to `0.0`. If you want a light to be as bright as possible, set it to `1.0`. Play around with different number combinations to see what the output colour will be. **Remember to run your code after updating the values!**


 * callout(Accepted values):
 Technically, the update functions will accept any number as input but for our purposes anything greater than `1.0` will be rounded back down to `1.0` and the inverse goes for `0.0`. Safety first y'all!

*/
//#-hidden-code

import UIKit
import PlaygroundSupport

enum setColour {
	
	// Enumeration of the three colours of LED light.

    case Red, Green, Blue
}

class colourLED: UIView {

	// Class that builds an LED image inside a UIView. Initilisation requires a setColour value to detirmine the initial colour value of the LED. LED is drawn with UIBezierPaths placed inside UIView layers.
	
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

class colourOutput: UIView {

	// Class that builds the output view for the final colour representation. Again, draws out wiring and output square with UIBezierPath and placed inside a the class layer.

    var outputSquare = CAShapeLayer()
    var outputWire = CAShapeLayer()
	
    init() {
        super.init(frame: CGRect(x: 10, y: 10, width: 360, height: 400))
		
		let squarePath = UIBezierPath()
		squarePath.move(to: CGPoint(x: 90, y: 95))
		squarePath.addLine(to: CGPoint(x: 90, y: 310))
		squarePath.addLine(to: CGPoint(x: 295, y: 310))
		squarePath.addCurve(to: CGPoint(x: 305, y: 300), controlPoint1: CGPoint(x: 300, y: 310), controlPoint2: CGPoint(x: 305, y: 305))
		squarePath.addLine(to: CGPoint(x: 305, y: 105))
		squarePath.addCurve(to: CGPoint(x: 295, y: 95), controlPoint1: CGPoint(x: 305, y: 100), controlPoint2: CGPoint(x: 300, y: 95))
		squarePath.addLine(to: CGPoint(x: 90, y: 95))
		
        let wirePath = UIBezierPath()
        wirePath.move(to: CGPoint(x: 350, y: 0))
        wirePath.addLine(to: CGPoint(x: 10, y: 0))
        wirePath.addCurve(to: CGPoint(x: 0, y: 10), controlPoint1: CGPoint(x: 5, y: 0), controlPoint2: CGPoint(x: 0, y: 5))
        wirePath.addLine(to: CGPoint(x: 0, y: 200))
        wirePath.addCurve(to: CGPoint(x: 10, y: 210), controlPoint1: CGPoint(x: 0, y: 205), controlPoint2: CGPoint(x: 5, y: 210))
        wirePath.addLine(to: CGPoint(x: 65, y: 210))
        wirePath.addCurve(to: CGPoint(x: 75, y: 220), controlPoint1: CGPoint(x: 70, y: 210), controlPoint2: CGPoint(x: 75, y: 215))
        wirePath.addLine(to: CGPoint(x: 75, y: 300))
        wirePath.addCurve(to: CGPoint(x: 85, y: 310), controlPoint1: CGPoint(x: 75, y: 305), controlPoint2: CGPoint(x: 80, y: 310))
        wirePath.addLine(to: CGPoint(x: 90, y: 310))
        wirePath.addLine(to: CGPoint(x: 90, y: 95))
        wirePath.addLine(to: CGPoint(x: 85, y: 95))
        wirePath.addCurve(to: CGPoint(x: 75, y: 105), controlPoint1: CGPoint(x: 80, y: 95), controlPoint2: CGPoint(x: 75, y: 100))
        wirePath.addLine(to: CGPoint(x: 75, y: 185))
        wirePath.addCurve(to: CGPoint(x: 65, y: 195), controlPoint1: CGPoint(x: 75, y: 190), controlPoint2: CGPoint(x: 70, y: 195))
        wirePath.addLine(to: CGPoint(x: 25, y: 195))
        wirePath.addCurve(to: CGPoint(x: 15, y: 185), controlPoint1: CGPoint(x: 20, y: 195), controlPoint2: CGPoint(x: 15, y: 190))
        wirePath.addLine(to: CGPoint(x: 15, y: 25))
        wirePath.addCurve(to: CGPoint(x: 25, y: 15), controlPoint1: CGPoint(x: 15, y: 20), controlPoint2: CGPoint(x: 15, y: 15))
        wirePath.addLine(to: CGPoint(x: 350, y: 15))
        wirePath.addCurve(to: CGPoint(x: 350, y: 0), controlPoint1: CGPoint(x: 358, y: 15), controlPoint2: CGPoint(x: 358, y: 0))
        wirePath.close()
		
		outputSquare.path = squarePath.cgPath
		
        outputWire.path = wirePath.cgPath
        outputWire.fillColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00).cgColor
		
		self.layer.addSublayer(outputSquare)
        self.layer.addSublayer(outputWire)
		
    }
	
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class PageTwo: UIViewController {

	// Page view controller, all placement and organisation is done with NSLayoutConstraints.
	
    let redLight = colourLED(colourBase: .Red)
    let greenLight = colourLED(colourBase: .Green)
    let blueLight = colourLED(colourBase: .Blue)
    let finalOutput = colourOutput()
    let redLabel = UILabel()
    let greenLabel = UILabel()
    let blueLabel = UILabel()
    let finalLabel = UILabel()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        self.view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
		
		finalLabel.text = "Colour Output"
		finalLabel.font = UIFont.boldSystemFont(ofSize: 16)
		finalLabel.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
		
		redLabel.text = "1.0"
		greenLabel.text = "1.0"
		blueLabel.text = "1.0"
		redLabel.font = UIFont.boldSystemFont(ofSize: 12)
		greenLabel.font = UIFont.boldSystemFont(ofSize: 12)
		blueLabel.font = UIFont.boldSystemFont(ofSize: 12)
		redLabel.textColor = UIColor(red: 0.71, green: 0.16, blue: 0.12, alpha: 1.00)
		greenLabel.textColor = UIColor(red: 0.26, green: 0.81, blue: 0.68, alpha: 1.00)
		blueLabel.textColor = UIColor(red: 0.26, green: 0.69, blue: 0.97, alpha: 1.00)
		
        redLight.translatesAutoresizingMaskIntoConstraints = false
        greenLight.translatesAutoresizingMaskIntoConstraints = false
        blueLight.translatesAutoresizingMaskIntoConstraints = false
        finalOutput.translatesAutoresizingMaskIntoConstraints = false
        finalLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
		
        self.view.addSubview(finalOutput)
        self.view.addSubview(redLight)
        self.view.addSubview(greenLight)
        self.view.addSubview(blueLight)
        self.view.addSubview(finalLabel)
		self.view.addSubview(redLabel)
        self.view.addSubview(greenLabel)
		self.view.addSubview(blueLabel)
		
        self.view.addConstraints([
			
        	// Final Output
        	NSLayoutConstraint(item: finalOutput, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
        	NSLayoutConstraint(item: finalOutput, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 400),
        	NSLayoutConstraint(item: finalOutput, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 360),
        	NSLayoutConstraint(item: finalOutput, attribute: .top, relatedBy: .equal, toItem: greenLight, attribute: .bottom, multiplier: 1.0, constant: -16),
			
            // Red Light
            NSLayoutConstraint(item: redLight, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: redLight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200),
            NSLayoutConstraint(item: redLight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100),
			
            // Green Light
            NSLayoutConstraint(item: greenLight, attribute: .leading, relatedBy: .equal, toItem: redLight, attribute: .trailing, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: greenLight, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: greenLight, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: greenLight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200),
            NSLayoutConstraint(item: greenLight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100),
			
            // Blue Light
            NSLayoutConstraint(item: blueLight, attribute: .leading, relatedBy: .equal, toItem: greenLight, attribute: .trailing, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: blueLight, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 50),
            NSLayoutConstraint(item: blueLight, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200),
            NSLayoutConstraint(item: blueLight, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100),
			
            //Final Label
            NSLayoutConstraint(item: finalLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: finalLabel, attribute: .centerY, relatedBy: .equal, toItem: finalOutput, attribute: .centerY, multiplier: 1.0, constant: -124),
			
			// Red Label
            NSLayoutConstraint(item: redLabel, attribute: .centerX, relatedBy: .equal, toItem: redLight, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: redLight, attribute: .top, relatedBy: .equal, toItem: redLabel, attribute: .bottom, multiplier: 1.0, constant: 0),
			
            // Green Label
            NSLayoutConstraint(item: greenLabel, attribute: .centerX, relatedBy: .equal, toItem: greenLight, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: greenLight, attribute: .top, relatedBy: .equal, toItem: greenLabel, attribute: .bottom, multiplier: 1.0, constant: 0),
			
            // Blue Label
            NSLayoutConstraint(item: blueLabel, attribute: .centerX, relatedBy: .equal, toItem: blueLight, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blueLight, attribute: .top, relatedBy: .equal, toItem: blueLabel, attribute: .bottom, multiplier: 1.0, constant: 0)
			
		])
		
    }
	
}

let CurrentPage = PageTwo() // Initilisation of the PageTwo view controller class. This is done here so that the three update functions can reference the internal light values.

func updateRed(lightBrightness: Double) {

	// The first of the three update functions. All functions follow exactly the same logic just with different references. Because there was no way (that I currently know of at least) to bound the user input between 1 and 0 other than breaking, these functions make sure the input is inside the necesary bounds before updating the stored colour value and the LEDs actual colour value.
	
    if lightBrightness > 1.00 {
        CurrentPage.redLight.colourValue = 1.00
        CurrentPage.redLight.lightLayer.fillColor = UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    } else if lightBrightness < 0.00 {
        CurrentPage.redLight.colourValue = 0.00
        CurrentPage.redLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    } else {
        CurrentPage.redLight.colourValue = lightBrightness
        CurrentPage.redLight.lightLayer.fillColor = UIColor(red: CGFloat(lightBrightness), green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    }
	
}

func updateGreen(lightBrightness: Double) {
	
    if lightBrightness > 1.00 {
        CurrentPage.greenLight.colourValue = 1.00
        CurrentPage.greenLight.lightLayer.fillColor = UIColor(red: 0.00, green: 1.00, blue: 0.00, alpha: 1.00).cgColor
    } else if lightBrightness < 0.00 {
        CurrentPage.greenLight.colourValue = 0.00
        CurrentPage.greenLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    } else {
        CurrentPage.greenLight.colourValue = lightBrightness
        CurrentPage.greenLight.lightLayer.fillColor = UIColor(red: 0.00, green: CGFloat(lightBrightness), blue: 0.00, alpha: 1.00).cgColor
    }
	
}

func updateBlue(lightBrightness: Double) {
	
    if lightBrightness > 1.00 {
        CurrentPage.blueLight.colourValue = 1.00
        CurrentPage.blueLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    } else if lightBrightness < 0.00 {
        CurrentPage.blueLight.colourValue = 0.00
        CurrentPage.blueLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    } else {
        CurrentPage.blueLight.colourValue = lightBrightness
        CurrentPage.blueLight.lightLayer.fillColor = UIColor(red: 0.00, green: 0.00, blue: CGFloat(lightBrightness), alpha: 1.00).cgColor
    }
	
}

PlaygroundPage.current.liveView = CurrentPage

// User accessible locations of the three update functions is below. Only the input values can be changed. This is so there is always a value (unless the user removes the values completely) provided to the final operations.

//#-end-hidden-code

updateRed(lightBrightness: /*#-editable-code*/0.99/*#-end-editable-code*/)
updateGreen(lightBrightness: /*#-editable-code*/0.82/*#-end-editable-code*/)
updateBlue(lightBrightness: /*#-editable-code*/0.44/*#-end-editable-code*/)

/*:
 #### Exercises
 * Can you make our pixel output show the colour purple? What about light blue?
 * What happens when you set all three values to `1.0`? What about `0.0`?
 * What combination of numbers do you need to make a murky brown colour?
*/
//#-hidden-code

// Final step is to take the verified colour values from the CurrentPage object and update the colour labels and the output colour square.

CurrentPage.finalOutput.outputSquare.fillColor = UIColor(red: CGFloat(CurrentPage.redLight.colourValue), green: CGFloat(CurrentPage.greenLight.colourValue), blue: CGFloat(CurrentPage.blueLight.colourValue), alpha: 1.00).cgColor
CurrentPage.redLabel.text = String(describing: CurrentPage.redLight.colourValue)
CurrentPage.greenLabel.text = String(describing: CurrentPage.greenLight.colourValue)
CurrentPage.blueLabel.text = String(describing: CurrentPage.blueLight.colourValue)

//#-end-hidden-code


