package main

import (
	"fmt"
	"github.com/spf13/cobra"
	"os/exec"
)

func main() {

	// find `go` executable path
	goExecPath, err := exec.LookPath("go")

	// go version command
	cmdGoVer := &exec.CMD{
		Path:   goExecutable,
		Args:   []string{goExecutable, "version"},
		Stdout: os.Stdout,
		Stderr: os.Stdout,

		// init cobra

	}

	// run `go version` command
	if err := cmdGoVer.Run(); err != nil {
		fmt.Println("Error: ", err)
	}
}
