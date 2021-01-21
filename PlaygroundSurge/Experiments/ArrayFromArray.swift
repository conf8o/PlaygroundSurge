import Foundation

func arrayFromArray() {
    var start = Date()
    var a = Array(repeating: 0, count: 5_000_000)
    let elapsed1 = Date().timeIntervalSince(start)
    // 0.022262930870056152

    start = Date()
    var b = Array(a)
    let elapsed2 = Date().timeIntervalSince(start)
    // 4.601478576660156e-05
    // O(1)

    start = Date()
    b[1000] = 9999
    let elapsed3 = Date().timeIntervalSince(start)
    // 0.021793007850646973
    // コピーが走ってる

    start = Date()
    b[2000] = 9999
    let elapsed4 = Date().timeIntervalSince(start)
    // 9.5367431640625e-07
    
    // ArrayにArrayを渡すインスタンス化はCopy-On-Write
    print(elapsed1, elapsed2, elapsed3, elapsed4)
}