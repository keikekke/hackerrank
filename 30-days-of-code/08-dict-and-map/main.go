package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	//Enter your code here. Read input from STDIN. Print output to STDOUT

	scanner := bufio.NewScanner(os.Stdin)

	scanner.Scan()
	n, _ := strconv.ParseInt(scanner.Text(), 10, 64)

	m := make(map[string]string, n)

	for i := 0; i < int(n); i++ {
		scanner.Scan()
		kv := strings.Split(scanner.Text(), " ")
		m[kv[0]] = kv[1]
	}

	for scanner.Scan() {
		key := scanner.Text()

		val, ok := m[key]
		if !ok {
			fmt.Println("Not found")
		} else {
			fmt.Printf("%v=%v\n", key, val)
		}
	}

}
