import Foundation

// 演算子に使える文字と記号(1文字目以降)
func uni(_ s: Int, _ e: Int) -> [Int] {
   return (s ... e).map { $0 }
}

var list = [Int]()
list.append(contentsOf: [0x002F, 0x003D, 0x002D, 0x002B, 0x0021, 0x002A, 0x0025, 0x003C, 0x003E, 0x0026, 0x007C, 0x005E, 0x007E, 0x003F])
list.append(contentsOf: uni(0x00A1, 0x00A7))
list.append(contentsOf: [0x00A9, 0x00AB])
list.append(contentsOf: [0x00AC, 0x00AE])
list.append(contentsOf: uni(0x00B0, 0x00B1))
list.append(contentsOf: [0x00B6, 0x00BB, 0x00BF, 0x00D7, 0x00F7])
list.append(contentsOf: uni(0x2016, 0x2017))
list.append(contentsOf: uni(0x2020, 0x2027))
list.append(contentsOf: uni(0x2030, 0x203E))
list.append(contentsOf: uni(0x2041, 0x2053))
list.append(contentsOf: uni(0x2055, 0x205E))
list.append(contentsOf: uni(0x2190, 0x23FF))
list.append(contentsOf: uni(0x2500, 0x2775))
list.append(contentsOf: uni(0x2794, 0x2BFF))
list.append(contentsOf: uni(0x2E00, 0x2E7F))
list.append(contentsOf: uni(0x3001, 0x3003))
list.append(contentsOf: uni(0x3008, 0x3020))
list.append(0x3030)

//print(list.count)
let all = list.compactMap { UnicodeScalar($0) }.map { "\($0)"}.joined(separator: ", ")
//print(all)


/*
 演算子の種類
    - prefix(単行演算子)
    - postfix(単行演算子)
        - 関数の引数は一つしか持てない
    - infix(二項演算子)
 */

 

// 平芳根を返す
prefix operator √
prefix func √(value: Double) -> Double {
    return sqrt(value)
}
print(√2)

// ２乗を返す
postfix operator ^^

postfix func ^^(org: Double) -> Double {
    return org * org
}

print(2^^)

