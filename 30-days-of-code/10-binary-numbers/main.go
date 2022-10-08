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
	n := int(nTemp)

	ret := 0
	cur := 0
	for pow := (1 << 30); pow > 0; pow >>= 1 {
		if n >= pow {
			cur++
			n -= pow
		} else {
			if cur > ret {
				ret = cur
			}
			cur = 0
		}
	}

	if cur > ret {
		ret = cur
	}

	fmt.Println(ret)
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
