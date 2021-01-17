import Foundation
import AGGRenderer
import SwiftPlot

var output_path = config["output_path"]!

func setOutputPath(path: String) {
    output_path = path
}

func plot(_ xs: [Float], _ ys: [Float], fileName: String) throws {
    let agg_renderer: AGGRenderer = AGGRenderer()
    var lineGraph = LineGraph<Float,Float>(enablePrimaryAxisGrid: true)
    lineGraph.addSeries(xs, ys, label: "Plot 1", color: .lightBlue)
    lineGraph.plotLabel.xLabel = "X-AXIS"
    lineGraph.plotLabel.yLabel = "Y-AXIS"
    lineGraph.plotLineThickness = 3.0
    try lineGraph.drawGraphAndOutput(fileName: output_path + fileName, renderer: agg_renderer)
}
