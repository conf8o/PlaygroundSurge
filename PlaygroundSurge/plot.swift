import Foundation
import AGGRenderer
import SwiftPlot

struct Plot<R: Renderer> {
    var outputPath: String
    let renderer: R
    var plotCount: Int = 0

    var plotHistory: String { 
        let title = "Plot" + String(plotCount)
        plotCount += 1
        return title    
    }

    func plotLine(_ xs: [Float], _ ys: [Float], fileName: String? = nil) throws {
        var outputFileName = fileName ?? plotHistory

        var lineGraph = LineGraph<Float,Float>(enablePrimaryAxisGrid: true)
        lineGraph.addSeries(xs, ys, label: outputFileName, color: .lightBlue)

        try lineGraph.drawGraphAndOutput(fileName: outputPath + outputFileName, renderer: renderer)
    }
}

var plot = Plot<AGGRenderer>(
    outputPath: CONFIG["output_path"]!, 
    renderer: AGGRenderer()
)


