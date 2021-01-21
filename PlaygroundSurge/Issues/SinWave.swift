import Foundation
import Surge

func timeAxis(ms: Float, rate: Float) -> [Float] {
    return [Float](stride(from: 0.0, to: ms / 1000, by: 1 / rate))
}

func plotSinWave() throws {
    let rate: Float = 16000
    let ms: Float = 2000
    let xs = timeAxis(ms: ms, rate: rate)
    
    let k: Float = 2
    let w = k * 2 * Float.pi
    
    var wave = sin(xs * w)
    
    try plot.plotLine(xs, wave, fileName: "sin_wave")
}
