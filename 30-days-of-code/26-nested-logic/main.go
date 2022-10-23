package main

import (
	"fmt"
)

func main() {
	var d1, m1, y1 int // returned date
	var d2, m2, y2 int // due date

	_, err := fmt.Scanf("%d %d %d", &d1, &m1, &y1)
	checkError(err)

	_, err = fmt.Scanf("%d %d %d", &d2, &m2, &y2)
	checkError(err)

	var fine int

	switch {
	case y1 > y2:
		fine = 10000
	case y1 == y2 && m1 > m2:
		fine = 500 * (m1 - m2)
	case y1 == y2 && m1 == m2 && d1 > d2:
		fine = 15 * (d1 - d2)
	default:
		fine = 0
	}

	fmt.Println(fine)

}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
