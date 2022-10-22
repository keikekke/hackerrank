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

	s, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
	checkError(err)
	T := int(s)

	for i := 0; i < T; i++ {
		s, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
		checkError(err)
		n := int(s)

		// case even
		if n == 2 {
			fmt.Println("Prime")
			continue
		} else if n%2 == 0 {
			fmt.Println("Not prime")
			continue
		}

		// case odd (1)
		if n == 1 {
			fmt.Println("Not prime")
			continue
		}

		// case odd
		found := false
		for j := 3; j*j <= n; j += 2 {
			if n%j == 0 {
				found = true
				break
			}
		}
		if found {
			fmt.Println("Not prime")
		} else {
			fmt.Println("Prime")
		}
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
