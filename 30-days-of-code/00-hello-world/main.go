package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	text, err := reader.ReadString('\n')
	if err != io.EOF && err != nil {
		log.Println(err)
	}

	fmt.Println("Hello, World.")
	fmt.Println(text)
}
