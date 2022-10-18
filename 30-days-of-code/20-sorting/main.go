package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

func main() {
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	nTemp, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)
	n := int32(nTemp)

	aTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

	var a []int32

	for i := 0; i < int(n); i++ {
		aItemTemp, err := strconv.ParseInt(aTemp[i], 10, 64)
		checkError(err)
		aItem := int32(aItemTemp)
		a = append(a, aItem)
	}

	// Write your code here
	totalSwaps := 0
	for i := 0; i < int(n); i++ {
		// Track number of elements swapped during a single array traversal
		numberOfSwaps := 0

		for j := 0; j < int(n-1); j++ {
			// Swap adjacent elements if they are in decreasing order
			if a[j] > a[j+1] {
				a[j], a[j+1] = a[j+1], a[j]
				numberOfSwaps++
				totalSwaps++
			}
		}

		// If no elements were swapped during a traversal, array is sorted
		if numberOfSwaps == 0 {
			break
		}
	}

	fmt.Printf("Array is sorted in %v swaps.\n", totalSwaps)
	fmt.Printf("First Element: %v\n", a[0])
	fmt.Printf("Last Element: %v\n", a[len(a)-1])
}

func readLine(reader *bufio.Reader) string {
	str, _, err := reader.ReadLine()
	if err == io.EOF {
		return ""
	}

	return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
