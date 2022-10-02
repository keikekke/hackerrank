package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strconv"
	"strings"
)

func format(s string) string {
	even, odd := "", ""
	for i, c := range s {
		if i%2 == 0 {
			even += string(c)
		} else {
			odd += string(c)
		}
	}
	return even + " " + odd
}

func main() {
	// Ensure buffer size is enough for receiving inputs
	reader := bufio.NewReaderSize(os.Stdin, 16*1024*1024)

	T, err := strconv.ParseInt(readLine(reader), 10, 64)
	checkError(err)

	for i := int64(0); i < T; i++ {
		s := readLine(reader)
		fmt.Println(format(s))
	}

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
