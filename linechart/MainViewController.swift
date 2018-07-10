
import UIKit
import QuartzCore

class MainViewController: UIViewController, LineChartDelegate {

    
    
    var label = UILabel()
    var lineChart: LineChart!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let text = UITextField.init(frame: CGRect.init(x: 0, y: 0, width: 155, height: 30))
        text.center = self.view.center
        
        
        var views: [String: AnyObject] = [:]
        
        label.text = "..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        views["label"] = label
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))
        
        // simple arrays
        
        // simple line with custom x axis labels
        let xLabels: [String] = ["Jan", "Feb", "Mar", "Apr"]
        
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = false
        lineChart.x.labels.visible = true
        
        lineChart.x.grid.count = 5
        lineChart.y.grid.count = 5
        lineChart.x.grid.visible = true
        lineChart.y.grid.visible = true
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = false
        /*
         },
         "unit": "mmol/L",
         "min": 0.161,
         "normal_min": 5.2,
         "normal_max": null,
         "max": 18.26,
         "condition": "LESS"
         },
         "results": [
         {
         "value": 4.24,
         "created": "2016-10-07T08:00:00.000+08:00",
         "status": 1
         }
        */
        
        let data: [CGFloat] = [4.7]
        lineChart.addLine(data)
        
        lineChart.maxGraph = 13
        lineChart.minGraph = 0
        lineChart.min = 3.5
        lineChart.max = 7.7
        lineChart.selectedValue = 4.7

        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
   
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    /**
     * Line chart delegate method.
     */
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        label.text = "x: \(x)     y: \(yValues)"
    }
    
    
    
    /**
     * Redraw chart on device rotation.
     */
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }

}
