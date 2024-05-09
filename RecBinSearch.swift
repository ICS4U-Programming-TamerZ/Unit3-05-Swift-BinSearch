import Foundation

/**
 Performs binary search recursively.
 
 This program reads input from a file named input.txt,
 where each line contains a sorted array of integers separated by spaces
 followed by a space and the target element to search for.
 It then performs binary search for each line using the recursive function "binarySearch",
 and writes the results to a file named output.txt.
 
 - Author: Tamer
 - Version: 1.0
 - Since: 2024-05-06
 */
class RecBinSearch {
    /// Recursive function to perform binary search
    ///
    /// - Parameters:
    ///   - arr: The sorted array to search in.
    ///   - target: The element to search for.
    ///   - low: The lower index of the search range.
    ///   - high: The higher index of the search range.
    /// - Returns: The index of the target element if found, otherwise -1.
    func binarySearch(arr: [Int], target: Int, low: Int, high: Int) -> Int {
        if low > high {
            return -1 // Element not found
        }
        
        let mid = low + (high - low) / 2
        
        if arr[mid] == target {
            return mid // Element found at mid index
        } else if arr[mid] < target {
            return binarySearch(arr: arr, target: target, low: mid + 1, high: high) // Search in the right half
        } else {
            return binarySearch(arr: arr, target: target, low: low, high: mid - 1) // Search in the left half
        }
    }
    
    /// Main function to execute the binary search program.
    func main() {
        do {
            // Open input file for reading
            let inputFile = try String(contentsOfFile: "input.txt")
            let lines = inputFile.components(separatedBy: .newlines)
            
            // Open output file for writing
            let outputFile = "output.txt"
            
            // Initialize the file writer
            var outputContent = ""
            
            for line in lines {
                let parts = line.components(separatedBy: " ")
                let arr = parts.dropLast().compactMap { Int($0) }
                let target = Int(parts.last ?? "") ?? 0
                
                // Performing binary search using the recursive function
                let index = binarySearch(arr: arr, target: target, low: 0, high: arr.count - 1)
                
                // Writing the result to output.txt
                if index != -1 {
                    outputContent += "Target \(target) found at index \(index) in the array.\n"
                } else {
                    outputContent += "Target \(target) not found in the array.\n"
                }
            }
            
            // Write content to output file
            try outputContent.write(toFile: outputFile, atomically: true, encoding: .utf8)
            print("Results written to \(outputFile)")
            
        } catch {
            // Handle file IO error
            print("Error: \(error)")
        }
    }
}

// Instantiate and execute the binary search program
let recBinSearch = RecBinSearch()
recBinSearch.main()
