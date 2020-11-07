package main

import (
	"fmt"
	"os/exec"
)

func main() {

	// find `go` executable path
	goExecPath, err := exec.LookPath("go")

	if err != nil {
		fmt.Println("Error: ", err)
	} else {
		fmt.Println("Go Executable: ", goExecPath)
	}
}
