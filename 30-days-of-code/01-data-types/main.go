package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	var i uint64 = 4
	var d float64 = 4.0
	var s string = "HackerRank "

	scanner := bufio.NewScanner(os.Stdin)

	var ii uint64
	var dd float64
	var ss string

	scanner.Scan()
	ii, _ = strconv.ParseUint(scanner.Text(), 10, 64)
	scanner.Scan()
	dd, _ = strconv.ParseFloat(scanner.Text(), 64)
	scanner.Scan()
	ss = scanner.Text()

	fmt.Println(i + ii)
	fmt.Printf("%.1f\n", d+dd)
	fmt.Println(s + ss)
}
